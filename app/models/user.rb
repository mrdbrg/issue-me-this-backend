class User < ApplicationRecord
  has_many :comments
  has_many :issues
  has_many :user_skills
  has_many :skills, through: :user_skills
end
