class LikeCommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :comment_id, :is_like
end
