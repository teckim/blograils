class LikesController < ApplicationController
  def create
    @like = Like.new like_params
    @author = current_user
    @like.author = @author

    if (@like.valid?)
      @like.save

      redirect_to post_path @like.post
    else
      redirect_to post_path @like.post
    end
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
