class CommunitiesController < ApplicationController
  def index
    @communities = Community.all
    @markers = @communities.geocoded.map do |community|
      {
        lat: community.latitude,
        lng: community.longitude
      }
    end
  end
end
