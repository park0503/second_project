class UsersController < ApplicationController
    def index
        @users = User.all
        @follow = current_user.follows.find_by(target_id: params[:target_id])
    end
    def new
    end
    def edit
        
    end
    def show
        @user = User.find_by(id: params[:id])
        @posts = Post.order(created_at: :desc)
        @followers = Follow.where(target_id: params[:id])
        @follows = Follow.where(user_id: params[:id])
    end
    def create
       
    end
    def update
       user = User.find_by(id: params[:id])
       user.update user_params
       redirect_to user_path(user)
    end
    def destroy
        
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

    private
    def user_params
        params.require(:user).permit(:id, :name, :email, :address1, :address2, :zipcode, :phone, :image, :introduce)
    end
end
