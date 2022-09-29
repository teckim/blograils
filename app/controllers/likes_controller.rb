class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @like = Like.new like_params
    @author = current_user
    @like.author = @author

    @like.save if @like.valid?
    redirect_to post_path @like.post
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
