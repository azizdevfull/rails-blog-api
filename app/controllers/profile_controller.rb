class ProfileController < ApplicationController
  before_action :authenticate_request
  # GET /me
  def me
    render json: @current_user
  end
end
