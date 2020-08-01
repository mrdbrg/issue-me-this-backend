class UsersController < ApplicationController

  def index
    users = User.all

    render json: users
  end

  def show
    user = User.find_by(id: params[:id])
    skills = UserSkill.all.find_all { |s|  s.user_id === user.id }.collect { |s| s.skill }
    
    render json: {user: UserSerializer.new(user), skills: skills}
  end

  def create
    # byebug
    # =============> 1 - user is being created

    # create user
    user = User.create(
      username: params[:username],
      age: params[:age],
      profession: params[:profession],
      avatar: params[:avatar],
      password: params[:password]
    )
    # =============> 2 - user's top skills are being retrieved from database

    # collect skills from params
    top_skills = Skill.all.find_all { |skill| params[:topSkills].include?(skill[:text]) }
    
    # =============> 3 - user's skills are associated to user

    # create association between new user and skills
    top_skills.each do |topSkill|
      UserSkill.create(
        user: user,
        skill: topSkill
      )
    end

    # =============> 4 - it's validating

    # if user was successfully created
    if user.valid?

      # =============> 5 - it's encoding id

      # encrypt the user id ====> token = JWT.encode payload, password parameter, 'algorithm'
      token = JWT.encode({ user_id: user.id }, "not_too_safe", "HS256")

      # if it validates to true renders json: user & token ====> run user explicitly through serializer
      render json: { user: UserSerializer.new(user), token: token }
    else
      # if user is not valid - render error messages (rails validation messages) and status code
      render json: { message: user.errors.full_messages }, status: :bad_request 
    end
  end
end
