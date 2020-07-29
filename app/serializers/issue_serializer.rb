class IssueSerializer < ActiveModel::Serializer
  attributes :id, :title, :issue_body, :comments
  belongs_to :user

  def comments
    ActiveModel::SerializableResource.new(object.comments,  each_serializer: CommentSerializer)
  end
end
