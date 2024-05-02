class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: { message: "User createed Successfully", user_id: user.id }
    else
      render json: {message: user.errors.full_messaged.join(', ')}, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password_digest)
  end
end
