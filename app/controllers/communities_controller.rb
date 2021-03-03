class CommunitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search, :create]
  before_action :community_params, only: :create

  def index
    if params[:query].present?
      if (Community.search_by_address(params[:query])).length > 0
        @community = policy_scope(Community.search_by_address(params[:query]))
        @markers = @community.geocoded.map do |community|
          {
            lat: community.latitude,
            lng: community.longitude
          }
        end
      else
        @community = policy_scope(Community.search_by_address(params[:query]))
        @empty_community = Community.new
      end
      authorize @community
    end
  end

  def search
    @communities = policy_scope(Community)
  end

  def create
    @community = Community.new(address: params["community"]["address"])
    if @community.save
      redirect_to new_user_registration_path
    else
      redirect_to "/communities"
    end
    authorize @community
  end

  # private

  def community_params
    params.require(:community).permit(:address)
  end
end
