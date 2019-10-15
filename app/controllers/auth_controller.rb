class AuthController < ApplicationController

  def login
    user = User.find_by(username: params[:username])
    is_authenticated = user.authenticate(params[:password])

    if is_authenticated
      token = encode_token(user.id)
      render json: {user: user, token: token}
    else
      render json: {errors: ["Incorrect Password, Please Try Again"]}, status: 422
    end
  end

end
