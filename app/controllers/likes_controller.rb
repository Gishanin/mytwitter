class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    @post.likes.create(user: current_user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def find_post
    p params
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = Like.find_by(post: @post, user: current_user)
  end
end
