class Issue < ApplicationRecord
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments
  belongs_to :user

  validates :title, 
            presence: true,
            length: { minimum: 5, maximum: 105 }

  validates :issue_body,
            presence: true, 
            length: { minimum: 2, maximum: 1000 }

end