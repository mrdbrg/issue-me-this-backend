class Issue < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :like_issues, dependent: :destroy
  has_many :favorites, dependent: :destroy

  self.per_page = 5

  accepts_nested_attributes_for :comments

  validates :title, 
            presence: true,
            length: { minimum: 5, maximum: 105 }

  validates :issue_body,
            presence: true, 
            length: { minimum: 2, maximum: 1000 }

  validates :syntax,
            presence: true

end