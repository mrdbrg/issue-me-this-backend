class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment_body, :issue_id
  belongs_to :user

  # # Source Article for the code below: https://medium.com/@stellamarisnjage/serializing-deeply-nested-associations-in-rails-2173d588c528
  # def user
  #   ActiveModel::SerializableResource.new(object.user,  each_serializer: UserSerializer)
  # end
end
