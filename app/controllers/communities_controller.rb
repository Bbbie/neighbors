class CommunitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search]
  before_action :community_params, only: :create

  def index
    if params[:query].present?
      @community = policy_scope(Community.search_by_address(params[:query]))
      @markers = @community.geocoded.map do |community|
        {
          lat: community.latitude,
          lng: community.longitude
        }
      end
    end
  end

  def search
    @communities = policy_scope(Community)
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      redirect_to "/users/sign_up"
    else
      redirect_to "/communities/search"
    end
    authorize @community
  end

  private

  def community_params
    params.require(:community).permit(:address)
  end
end
