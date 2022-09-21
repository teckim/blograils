class CommentsController < ApplicationController
  def create
    @comment = Comment.new comment_params
    @author = current_user
    @comment.author = @author

    @comment.save if @comment.valid?
    redirect_to post_path(@comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
