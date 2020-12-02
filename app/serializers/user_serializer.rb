class UserSerializer < ActiveModel::Serializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :email, :first_name, :last_name, :birthday, :job_title
  has_many :favorites
  has_many :like_issues
  has_many :like_comments
  has_many :issues
  has_many :skills

  attribute :profile_picture do |user|
    {
      image_url: user.get_profile_picture_url()
    }
  end
end
