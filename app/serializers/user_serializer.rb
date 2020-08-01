class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :age, :profession, :avatar
  has_many :issues
end
