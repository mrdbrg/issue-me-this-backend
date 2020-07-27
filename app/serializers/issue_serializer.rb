class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :issue_body, :comment_details, :user_info
end
