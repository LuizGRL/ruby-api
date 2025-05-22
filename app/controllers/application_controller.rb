class ApplicationController < ActionController::API
  def encode_toke(payload)
    JWT.encode(payload, "secret")
  end

  def decode_token
        auth_header = request.headers["Authorization"]
        if auth_header
          token = auth_header.split(" ").last
          begin
            JWT.decode(token, "secret", true, alogorithm: "HS256")
          rescue JWT::DecodeError
            nil
          end
        end
  end

  def authorized_token
    decoded_token = decode_token()
    if decode_token
      user_id = decoded_token[0]["user_id"]
      @user = User.find(user_id)
    end
  end

  def authorize
    render json: { message: "Precisa de login" }, status: :unauthorized unless authorized_token
  end
end
