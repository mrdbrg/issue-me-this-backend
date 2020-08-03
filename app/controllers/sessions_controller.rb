class SessionsController < ApplicationController
  def home
    
  end

  def login
    # byebug
    # find user by email
    user = User.find_by(email: params[:email])

    # validates user and password (authentication)
    if user && user.authenticate(params[:password])
      # byebug
      # encrypt the user id ====> token = JWT.encode payload, password parameter, 'algorithm'
      token = JWT.encode({ user_id: user.id }, "not_too_safe", "HS256")

      # if it validates to true renders json: user & token ====> run user explicitly through serializer
      render json: { user: UserSerializer.new(user), token: token, header: "Welcome, #{user.first_name} #{user.last_name}!", message: [], type: "success" }

      # default render before authentication ====> implicitly run through serializer
      # render json: user
    else
      # if user is not valid send error message and status
      render json: { header: "Uh-oh! Invalid email or password", message: [], type: "error" }, status: :unauthorized
    end
  end

  def autologin 
    # byebug
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

    # validates user
    if user 
      render json: user 
    else
      # if user doesn't validate renders error message and status
      render json: { message: "Not logged in" }, status: :unauthorized
    end
  end

  # json web token - jwt:
  # it's a feature available in a lot of different languages and it can generate 
  # an incrypted string (hash string) using the json web token format that would 
  # let us save information within the string. We can also decrypt that string 
  # value to use it. 
  # To encrypt it or decrypt it we will need a secret key that only the backend has access to. 
  # That means that even if someone finds the token on the client side they won't be able to 
  # decrypt the password, only the backend will be able to decrypt it.
end
