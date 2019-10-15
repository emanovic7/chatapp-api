class ApplicationController < ActionController::API

  def token
    request.headers["Authorization"].split(" ")[1]
  end

  def encode_token(user_id)
    payload = {
      user_id: user_id
    }
    JWT.encode(payload, "myAppSecret", 'HS256')
  end

  def decoded_token
    JWT.decode(token, "myAppSecret", true, { algorithm: 'HS256'})
  end

  def current_user
    User.find(decoded_token[0]["user_id"])
  end

end
