class CommentSerializer < ActiveModel::Serializer
  attributes :id, :title, :comment_body
end
