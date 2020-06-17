class HomeController < ApplicationController
    def index
        @posts = Post.order(created_at: :desc).limit(3)
    end
end
