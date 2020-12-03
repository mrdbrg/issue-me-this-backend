class UserSerializer < ActiveModel::Serializer
  # We need to add this line to allow url_helpers.
  include Rails.application.routes.url_helpers

  attributes :id, :email, :first_name, :last_name, :birthday, :job_title, :profile_picture
  has_many :favorites
  has_many :like_issues
  has_many :like_comments
  has_many :issues
  has_many :skills

  def profile_picture
    if object.profile_picture.attached?
      {
        image_url: rails_blob_url(object.profile_picture)
      }
    end
  end
end
