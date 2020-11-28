class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment_body, :syntax, :issue_id, :like_comments
  belongs_to :user
end
