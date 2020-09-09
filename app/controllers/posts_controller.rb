class PostsController < ApplicationController

    def index
       @posts = Post.all
    end

    def new
        @post = Post.new
    end    
    def show
        @post = Post.find(params[:id])
    end 

    def create
        @post = current_user.posts.new(post_params)

        if(@post.save)
            redirect_to posts_url
        else
        render 'new'
        end    
    end
    def edit

    end
    def update
        
    end
    def destroy

    end
    

    private def post_params
        params.require(:post).permit(:title, :text)
    end
end
