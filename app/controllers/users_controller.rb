class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def follow
    @user = User.find(params[:id])
    current_user.followees << @user
    redirect_back(fallback_location: user_path(@user))
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end

  def show; end

  def new; end

  def edit; end

  def create; end

  def update; end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end
