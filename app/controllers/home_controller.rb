class HomeController < ApplicationController
  before_action :check_current_user

  def index; end

  def check_current_user
    redirect_to posts_url if user_signed_in?
  end
end
