class PostsController < ApplicationController

    def index
        @posts = Post.all
    end
    def new

    end
    def edit
        @post = Post.find_by(id: params[:id])
    end
    def show
        @post = Post.find_by(id: params[:id])
        @like = current_user.likes.find_by(post_id: params[:post_id])
    end
    def create
        post = Post.create post_params
        redirect_to post_path(post)
    end
    def update
        post = Post.find_by(id: params[:id])
        post.update post_params
        redirect_to post_path(post)
    end
    def destroy
        post = Post.find_by(id: params[:id])
        post.destroy
        redirect_to posts_path
    end
    def my
        @posts = current_user.posts
    end

    skip_before_action :verify_authenticity_token
    def toggle
        @like = current_user.likes.find_by(post_id: params[:post_id])
        post = Post.find_by(id: params[:id])
        if @like.present?
            @like.destroy
        else
            Like.create(user_id: current_user.id, post_id: params[:post_id])
        end
        redirect_to :back
    end

    private
    def post_params
        params.require(:post).permit(:title, :body, :user_id)
    end
end
