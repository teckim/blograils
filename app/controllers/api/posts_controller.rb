class Api::PostsController < ApiController
  before_action :fetch_author, only: %i[index show]
  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = @author ? @author.posts.includes(:comments, :author) : Post.includes(:comments, :author).all

    render json: @posts
  end

  private

  def fetch_author
    return nil unless params[:user_id]

    @author = User.find(params[:user_id])
  end
end
