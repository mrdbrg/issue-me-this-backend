class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :issue_body, :code_body, :syntax, :comments
  belongs_to :user
end
