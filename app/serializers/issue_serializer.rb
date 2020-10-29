class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :issue_body, :syntax, :comments, :like_issues
  has_many :favorites
  belongs_to :user
end
