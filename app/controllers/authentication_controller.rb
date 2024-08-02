class AuthenticationController < ApplicationController
  # POST /register
  def register
    user = User.new(user_params)
    if user.save
      @token = encode_token({ user_id: user.id })
      render json: { message: "User created successfully", token: @token }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # POST /login
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      render json: { token: token }, status: :ok
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end

  # POST /logout
  def logout
    # For JWT authentication, logout is handled on the client side by deleting the token
    render json: { message: "Logged out successfully" }, status: :ok
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :image)
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secret_key_base)
  end
end
