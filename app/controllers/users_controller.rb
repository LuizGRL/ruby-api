class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_toke({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :ok
    else
      render json: { error: "Erro" }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.permit(:username, :password)
  end
end
