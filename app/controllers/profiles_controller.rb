class ProfilesController < ApplicationController
  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    profile = Profile.find_by(user: current_user)
    profile.update(profile_params) if profile.present?
    redirect_to profile_url
  end

  private

  def profile_params
    params.require(:profile).permit(:nickname, :first_name, :second_name, :age)
  end
end
