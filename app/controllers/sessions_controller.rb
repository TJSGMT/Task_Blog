class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username], password_digest: params[:password])
    if user && user.persisted?
      render json: { message: "Login Successfully", user_id: user.id }
    else
      render json: {message: "Invalid Username or Password"}, status: :unauthorized
    end
  end
end
