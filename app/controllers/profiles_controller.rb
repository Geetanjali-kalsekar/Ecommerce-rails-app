class ProfilesController < ApplicationController
  before_action :authenticate_user! # Ensure the user is authenticated
  before_action :set_profile, only: [:edit, :update]

 def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path(@profile), notice: 'Profile created successfully.'
    else
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

    def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profile updated successfully."
    else
      render :edit
    end
  end

  def set_profile
  @profile = current_user.profile # Assuming each user has one profile
end
  
    def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profile updated successfully."
    else
      render :edit
    end
  end


  private

  def profile_params
    params.require(:profile).permit(:name, :contact_no, :age, :gender)
  end
  
end
