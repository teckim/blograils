class Api::UsersController < ApiController
  skip_before_action :authorize_request, only: [:create], raise: false

  def index
    @users = User.all

    render json: @users
  end

  def show
    @user = User.find(params[:id])

    render json: @user
  end
end
