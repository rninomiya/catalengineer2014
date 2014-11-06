class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save 
      redirect_to @profile, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def profile_params
    params.require(:profile).permit(:name, :avatar)
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def index
    @profiles = Profile.all
  end
end
