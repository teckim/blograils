class PostsController < ApplicationController
  before_action :fetch_author, only: %i[index show]
  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = @author ? @author.posts.includes(:comments, :author) : Post.includes(:comments, :author).all
  end

  def show
    @post = @author ? @author.posts.find(params[:id]) : Post.find(params[:id])
  end

  def new; end

  def create
    @post = Post.new post_params
    @author = current_user
    @post.author = @author

    if @post.valid?
      @post.save

      redirect_to user_posts_path(@author)
    else
      redirect_to new_post_path
    end
  end

  private

  def fetch_author
    return nil unless params[:user_id]

    @author = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
