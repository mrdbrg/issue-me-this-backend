class UsersController < ApplicationController

  def index
    users = User.all

    render json: users
  end

  def show
    user = User.find_by(id: params[:id])
    skills = UserSkill.all.find_all { |s|  s.user_id === user.id }.collect { |s| s.skill }
    
    render json: { user: UserSerializer.new(user), skills: skills }
  end

  def create
    # create user
    user = User.create( 
      email: params[:email], 
      first_name: params[:first_name], 
      last_name: params[:last_name], 
      age: params[:age], 
      profession: params[:profession], 
      avatar: params[:avatar], 
      password: params[:password] 
    )
      
      # byebug
    # if user was successfully created
    if user.valid? 
       # if user is valid collect skills from params
      top_skills = Skill.all.find_all { |skill| params[:topSkills].include?(skill[:text]) }

      # if user is valid create association between new user and skills
      top_skills.each do |topSkill|
        UserSkill.create(
          user: user,
          skill: topSkill
        )
      end

      # encrypt the user id ====> token = JWT.encode payload, password parameter, 'algorithm'
      token = JWT.encode({ user_id: user.id }, "not_too_safe", "HS256")

      # if it validates to true renders json: user & token ====> run user explicitly through serializer
      render json: { user: UserSerializer.new(user), token: token }
    else

      # if user is not valid - render error messages (rails validation messages) and status code
      render json: { header: "You need to fulfill these #{user.errors.full_messages.count} password requirements", message: user.errors.full_messages }, status: :bad_request 
    end
  end
end
