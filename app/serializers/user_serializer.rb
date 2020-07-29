class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :profession, :avatar
end
