class LikeIssueSerializer < ActiveModel::Serializer
  attributes :id, :user, :issue, :is_like
end
