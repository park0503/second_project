class CommentsController < ApplicationController
    
    def create
       @comment = Comment.create comment_params
       @post = Post.find_by(id: @comment.post_id)
       #redirect_to post_path(comment.post)

    end

     def update
        comment = Comment.find_by(id: params[:id])
        comment.update comment_params if comment
        redirect_to post_path(comment.post)
    end

    def destroy
        @comment = Comment.find_by(id: params[:id])
        @post = Post.find_by(id: @comment.post_id)
        @comment.destroy if @comment
        #redirect_to post_path(comment.post)
    end


    private
    def comment_params
           params.require(:comment).permit(:body, :user_id, :post_id)
    end
end
