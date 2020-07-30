class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :age, :profession, :avatar
end
