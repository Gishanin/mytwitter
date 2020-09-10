class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show; end

  def new; end

  def edit; end

  def create; end

  def update; end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to home_url
  end
end
