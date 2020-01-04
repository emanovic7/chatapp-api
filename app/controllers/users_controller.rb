class UsersController < ApplicationController

  def index
    users = User.all 
    render json: users
  end

  def profile
    render json: current_user
  end

  def create
    user = User.create(user_params)
    if user.valid?
      token = encode_token(user.id)
      render json: {token: token}
    else
      render json: { errors: user.erros.full_messages }, status: 422
    end
  end


  private
    def user_params
      params.permit(:name, :email, :username, :password, :img)
    end

end
