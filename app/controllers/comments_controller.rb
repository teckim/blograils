class CommentsController < ApplicationController
  def create
    @comment = Comment.new comment_params
    @author = current_user
    @comment.author = @author

    if (@comment.valid?)
      @comment.save

      redirect_to post_path(@comment.post)
    else
      redirect_to post_path(@comment.post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
