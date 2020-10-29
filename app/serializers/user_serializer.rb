class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :age, :profession, :avatar
  has_many :favorites
  has_many :like_issues
  has_many :issues
  has_many :skills
end
