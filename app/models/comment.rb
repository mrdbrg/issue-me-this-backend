class Comment < ApplicationRecord
  belongs_to :issue
  belongs_to :user

  validates :title,
            presence: true,
            length: { minimum: 5, maximum: 255 }

  validates :comment_body,
            presence: true,
            length: { minimum: 5, maximum: 1000 }

end
