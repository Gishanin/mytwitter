class PostsController < ApplicationController
  def index
    @posts = Post.all
    if @posts.present?
      @posts
    else
      head 404
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to profile_url if @post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    return head 404 unless @post.present?
    redirect_to profile_url if @post.update(post_params)
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to profile_url
    end
  end

  private def post_params
    params.require(:post).permit(:title, :text)
  end
end
