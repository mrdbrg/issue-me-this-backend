class SessionsController < ApplicationController
  def home
  end

  def login
    user = User.find_by(email: params[:email])

    # validates user and password (authentication)
    if user && user.authenticate(params[:password])

      # encrypt the user id ====> token = JWT.encode payload, password parameter, 'algorithm'
      token = JWT.encode({ user_id: user.id }, "not_too_safe", "HS256")

      # if it validates to true renders json: user & token ====> run user explicitly serialization
      render json: { user: UserSerializer.new(user), token: token, header: "Welcome, #{user.first_name} #{user.last_name}!", errorStatus: false }
      
      # default render before authentication ====> implicitly serialization runs
      # render json: user

    elsif params[:password] == nil && params[:email] == nil
      render json: { header: "Please enter your email and password", error: [], errorStatus: true }, status: :unauthorized      
    else
      render json: { header: "Invalid email or password", error: [], errorStatus: true }, status: :unauthorized
    end
  end

  def autologin 
    # extract the auth header
    auth_header = request.headers['Authorization']

    # split the string and get the encrypted token we need
    token = auth_header.split(" ")[1]

    # decode token with JWT library
    decoded_toke = JWT.decode(token, "not_too_safe", true, { algorthim: "HS256"})

    # get the user_id from decoded token
    user_id = decoded_toke[0]["user_id"]

    # find user by id 
    user = User.find_by(id: user_id)

    if user 
      render json: user 
    else
      render json: { message: "Not logged in" }, status: :unauthorized
    end
  end
end
