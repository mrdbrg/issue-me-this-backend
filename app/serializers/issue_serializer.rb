class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :issue_body
end
