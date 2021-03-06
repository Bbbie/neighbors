class ProfilesController < ApplicationController
  before_action :set_profile, only: [:update, :show]

  def show
    @profile_user = @profile.user
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
      redirect_to cards_path(query: "missed")
    else
      render :new
    end
    authorize @profile
  end

  def update
    @profile.update(set_params)
    authorize @profile
    if @profile.update(set_params)
      redirect_to @profile
    else
      render :new
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def set_params
    params.require(:profile).permit(:floor, :phone_number, :about, :avatar)
  end
end
