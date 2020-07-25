class PostsController < ApplicationController

    def index
        @posts = Post.all
    end
    def new
        @post = Post.new
        3.times.each do
            @post.images.build
        end
    end
    def edit
        @post = Post.find_by(id: params[:id])
    end
    def show
        @post = Post.find_by(id: params[:id])
        if current_user.present?
            @like = current_user.likes.find_by(post_id: params[:id])
        end
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
        @post = Post.find_by(id: params[:post_id])
        like = current_user.likes.find_by(post_id: params[:post_id])
        temp = like
        if like.present?
            like.destroy
        else
            Like.create(user_id: current_user.id, post_id: params[:post_id])
            like = current_user.likes.find_by(post_id: params[:post_id])
            temp = like
        end
        #redirect_to post_path(temp.post)
    end

    private
    def post_params
        params.require(:post).permit(:title, :body, :user_id, images_attributes: [:image])
    end
end
