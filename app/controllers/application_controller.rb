class ApplicationController < ActionController::API
  private

  def authenticate_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header.present?
    decoded_token = JsonWebToken.decode(header)
    if decoded_token
      @current_user = User.find(decoded_token[:user_id])
    else
      render json: { error: "Not Authorized" }, status: :unauthorized
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Not Authorized" }, status: :unauthorized
  end

  def current_user
    @current_user
  end
end
