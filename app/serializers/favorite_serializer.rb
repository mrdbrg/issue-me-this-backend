class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :issue_id, :user_id
end
