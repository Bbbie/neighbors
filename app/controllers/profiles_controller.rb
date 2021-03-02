class ProfilesController < ApplicationController
  before_action :set_profile, only: [:update, :show]

  def show
    authorize @profile
  end

  def new
    @profile = Profile.new
    @user = current_user
    authorize @profile
  end

  def create
    @profile = Profile.new(set_params)
    @profile.user = current_user
    if @profile.save
      redirect_to "/cards"
    else
      render :new
    end
    authorize @profile
  end

  def update
    @profile.update(set_params)
    authorize @profile
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
