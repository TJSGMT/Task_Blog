class ApplicationController < ActionController::API
  before_action :authenticate_user

  Private

  def authenticate_user
    unless current_user
      render json: {error: "Unauthorized"}, status: :unauthorized
    end
  end


  def current_user

    @current_user ||= User.find_by(id: session[:user_id])
  end
end
