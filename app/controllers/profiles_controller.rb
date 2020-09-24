class ProfilesController < ApplicationController
  before_action :get_user_profile, only: :show

  def index
    @profiles = Profile.all
  end

  def show
    @posts = Post.find_by(user: current_user)
  end

  private

  def get_user_profile
    @profile = Profile.find(params[:id])
    redirect_to root_url if current_user == @profile.user
  end
end
