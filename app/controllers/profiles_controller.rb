class ProfilesController < ApplicationController
  before_action :set_profile, only: :update

  def update
    @profile.update(set_params)
    redirect_to "cards/"
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def set_params
    params.require(:profile).permit(:floor, :phone_number, :about, :avatar)
  end
end
