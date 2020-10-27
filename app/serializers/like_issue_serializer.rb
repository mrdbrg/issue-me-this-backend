class LikeIssueSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :issue_id, :is_like
end
