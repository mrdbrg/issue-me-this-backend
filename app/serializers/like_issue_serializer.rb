class LikeIssueSerializer < ActiveModel::Serializer
  attributes :id, :user, :issue
end
