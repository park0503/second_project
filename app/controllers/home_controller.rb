class HomeController < ApplicationController
    def index
        #@posts = Post.order(created_at: :desc).limit(3)
        @posts = Post.order(created_at: :desc)
        if current_user.present?
            @like = current_user.likes.find_by(post_id: params[:id])
        end
    end

    def users
        @users = User.all
        @follow = current_user.follows.find_by(target_id: params[:target_id])
    end

    def follow
        follow = current_user.follows.find_by(target_id: params[:target_id])
        if follow.present?
            follow.destroy
        else
            Follow.create(user_id: params[:user_id], target_id: params[:target_id])
        end
        redirect_to "/follow/#{current_user.id}"
    end

    def user_detail
        @user = User.find_by(id: params[:user_id])
        @posts = Post.order(created_at: :desc)
        @followers = Follow.where(target_id: params[:user_id])
        @follows = Follow.where(user_id: params[:user_id])
        @image = Image.find_by(post_id: params[:id])
    end
end
