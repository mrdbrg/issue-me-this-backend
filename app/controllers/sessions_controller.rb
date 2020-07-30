class SessionsController < ApplicationController
  def login
    # find user by username
    user = User.find_by(username: params[:username])

    # validates user and password (authentication)
    if user && user.authenticate(params[:password])
      # if user and password valid sends json and user
      render json: user
    else
      # if user is not valid send error message and status
      render json: { message: "Invalid username or password" }, status: :unauthorized
    end
  end
end
