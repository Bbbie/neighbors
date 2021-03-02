class CommunitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search]
  def index
    if params[:query].present?
      @community = policy_scope(Community.search_by_address(params[:query]))
    else
      @community = policy_scope(Community)
    end
    @markers = @community.geocoded.map do |community|
      {
        lat: community.latitude,
        lng: community.longitude
      }
    end
  end

  def search
    @communities = policy_scope(Community)
  end
end
