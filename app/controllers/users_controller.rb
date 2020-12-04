class UsersController < ApplicationController
  def index
    users = User.all

    render json: users
  end

  def show
    user = User.find_by(id: params[:id])
    # skills = UserSkill.all.find_all { |s|  s.user_id === user.id }.collect { |s| s.skill }
    
    render json: { user: UserSerializer.new(user) }
  end

  def create
    @user = User.new( 
      email: params[:email], 
      first_name: params[:first_name], 
      last_name: params[:last_name], 
      job_title: params[:job_title], 
      birthday: params[:birthday], 
      password: params[:password] 
    )
    # byebug
    
    if @user.valid? 
      
      path = Rails.root + "public/images/default-profile.jpg"
      @user.profile_picture.attach(io: File.open(path), filename: "#{@user.last_name}-#{@user.email}.jpg")      
      # byebug

      @user.save

      # byebug
       # if user is valid collect skills from params
      top_skills = Skill.all.find_all { |skill| params[:top_skills].include?(skill[:text]) }
      # if user is valid create association between new user and skills
      top_skills.each do |sk|
        UserSkill.create(
          user: @user,
          skill: sk
        )
      end

      # byebug
      # encrypt the user id ====> token = JWT.encode payload, password parameter, 'algorithm'
      token = JWT.encode({ user_id: @user.id }, "not_too_safe", "HS256")

      # byebug
      # if it validates to true renders json: user & token ====> run user explicitly through serializer
      render json: { user: UserSerializer.new(@user), token: token, errorStatus: false }
    else
      # if user is not valid - render error messages (rails validation messages) and status code
      # byebug
      render json: { header: "You need to fulfill these #{@user.errors.full_messages.count} requirements", error: @user.errors.full_messages, errorStatus: true }, status: :bad_request 
    end
  end

  def update 
    user = User.find_by(id: params[:id])
    new_skills = []
    remove_skills = []

    if params[:password] == nil
      password = user[:password_digest]
    else
      password = params[:password]
    end

    user.update(
      email: params[:email], 
      first_name: params[:first_name], 
      last_name: params[:last_name], 
      job_title: params[:job_title], 
      birthday: params[:birthday], 
      password: password 
    )

    # byebug
    if user.valid?

         # byebug
      if params[:remove_skills].count != 0
        remove_skills = params[:remove_skills]

        remove_skills.each do |sk|
          skill = Skill.find_by(value: sk)
          UserSkill.find_by(user: user, skill: skill).destroy
        end
      end

      # byebug
      if params[:new_skills].count != 0
        new_skills = params[:new_skills]

        new_skills.each do |sk|
          skill = Skill.find_by(value: sk)
          UserSkill.create( user: user, skill: skill )
        end
      end

      render json: { user: UserSerializer.new(user) }
    else
      render json: { header: "You need to fulfill these #{user.errors.full_messages.count} requirements", error: user.errors.full_messages, errorStatus: true }, status: :bad_request 
    end
  end

  def upload_photo
    @user = User.find(params[:id])
  
    @user.profile_picture.attach(params[:profile_picture])
    
    if @user.profile_picture.attached?
      render json: @user
    else
      render json: {errors: "No profile picture attached"}, status: 400
    end
  end
end
