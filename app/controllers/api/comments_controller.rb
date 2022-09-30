class Api::CommentsController < ApiController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    render json: @comments
  end

  def create
    @post = Post.find(params[:post_id])

    @comment = Comment.new comment_params
    @comment.post = @post
    @comment.author = @post.author

    @comment.save! if @comment.valid?
    render json: @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
