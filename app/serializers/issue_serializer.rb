class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :issue_body, :comments
  belongs_to :user
end
