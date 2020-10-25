class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :issue_body, :syntax, :comments
  belongs_to :user
end
