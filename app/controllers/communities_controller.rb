class CommunitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search]
  def index
    @communities = policy_scope(Community)
    @markers = @communities.geocoded.map do |community|
      {
        lat: community.latitude,
        lng: community.longitude
      }
  end

  def search
    @communities = policy_scope(Community)
  end
end
