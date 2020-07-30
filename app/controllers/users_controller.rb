class UsersController < ApplicationController

  def index
    users = User.all

    render json: users
  end

  def show
    user = User.find_by(id: params[:id])

    render json: user
  end

  def create
    byebug
    # create user
    user = User.create(
      username: params[:username],
      age: params[:age],
      profession: params[:profession],
      avatar: params[:avatar],
      password: params[:password],
    )

    # collect skills from params
    top_skills = Skill.all.find_all { |skill| params[:topSkills].include?(skill[:text]) }
    
    # create association between new user and skills
    top_skills.each do |topSkill|
      UserSkill.create(
        user: user,
        skill: topSkill
      )
    end

    # if user was successfully created
    if user.valid?
      # if user is valid render json with that new user and status code
      render json: user, status: :created
    else
      # if user is not valid - render error messages (rails validation messages) and status code
      render json: { message: user.errors.full_messages }, status: :bad_request 
    end
  end
end
