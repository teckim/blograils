class ApiController < ActionController::API
  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split.last if header
    puts 'header'
    puts header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Error message ActiveRecord' }, status: :unauthorized
    rescue JWT::ExpiredSignature
      render json: { errors: 'Error message JWT' }, status: :unauthorized
    end
  end
end
