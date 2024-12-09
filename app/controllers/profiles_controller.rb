class ProfilesController < ApplicationController
  before_action :authenticate_user! # Ensure the user is authenticated
  before_action :set_profile, only: [:edit, :update]

  def index
    @profiles = current_user.profile
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to user_profile_path(current_user), notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def show
    @profile = current_user.profile
    redirect_to new_user_profile_path(current_user) unless @profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to user_profile_path(current_user), notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def set_profile
    @profile = current_user.profile
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:name, :contact_no, :age, :gender)
  end 
end
