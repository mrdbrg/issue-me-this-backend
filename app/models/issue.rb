class Issue < ApplicationRecord
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments
  belongs_to :user
end
