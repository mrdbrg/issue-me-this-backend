class Comment < ApplicationRecord
  belongs_to :issue
  belongs_to :user
  has_many :like_comments, dependent: :destroy

  validates :comment_body,
            presence: true,
            length: { minimum: 5, maximum: 1000 }

  validates :syntax,
            presence: true

end
