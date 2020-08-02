class HomeController < ApplicationController
    def index
        #@posts = Post.order(created_at: :desc).limit(3)
        @posts = Post.order(created_at: :desc)
        if current_user.present?
            @like = current_user.likes.find_by(post_id: params[:id])
        end
    end
end
