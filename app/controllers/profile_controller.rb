class ProfileController < ApplicationController
  before_action :get_user_profile

  def show
    @posts = Post.find_by(user: current_user)
  end

  def update
    @profile.update(profile_params)
    redirect_to profile_url
  end

  private

  def get_user_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:nickname, :first_name, :second_name, :age)
  end
end
