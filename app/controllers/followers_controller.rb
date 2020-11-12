class FollowersController < ApplicationController
  before_action :get_user_followers, only: :show

  def index
    @users = User.all
    @user = User.find(params[:id])
  end

  def user_followers
    @user = User.where(id: params[:id]).first
    @followers = @user.get_followers
  end

  def followed_users
    Follower.where(follower_id: id)
  end
end
