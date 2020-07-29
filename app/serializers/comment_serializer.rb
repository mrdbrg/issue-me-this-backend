class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :comment_body
  belongs_to :user
end
