class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :issues
  has_many :favorites, dependent: :destroy
  has_many :like_issues, dependent: :destroy
  has_many :like_comments, dependent: :destroy

  has_many :user_skills
  has_many :skills, through: :user_skills

  accepts_nested_attributes_for :comments, allow_destroy: true

  before_save { self.email = email.downcase }
  VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, 
            presence: true

  validates :last_name, 
            presence: true

  validates :job_title, 
            presence: true

  validates :birthday, 
            presence: true

  validates :email, 
            presence: true,
            length: { maximum: 255 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_FORMAT }

  validates :password, 
            presence: true,
            length: { minimum:6, maximum: 255 }

  # validate :password_lower_case
  # validate :password_uppercase
  # validate :password_special_char
  # validate :password_contains_number

  # def password_lower_case
  #   return if !!password.match(/\p{Lower}/)
  #   errors.add :password, ' must contain at least 1 lowercase '
  # end

  # def password_uppercase
  #   return if !!password.match(/\p{Upper}/)
  #   errors.add :password, ' must contain at least 1 uppercase '
  # end

  # def password_special_char
  #   special = "?<>',?[]}{=-)(*&^%$#`~{}!"
  #   regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
  #   return if password =~ regex
  #   errors.add :password, ' must contain special character'
  # end

  # def password_contains_number
  #   return if password.count("0-9") > 0
  #   errors.add :password, ' must contain at least one number'
  # end

  # PASSWORD FORMAT
  # (?=.{8,})          # Must contain 8 or more characters
  # (?=.*\d)           # Must contain a digit
  # (?=.*[a-z])        # Must contain a lower case character
  # (?=.*[A-Z])        # Must contain an upper case character
  # (?=.*[[:^alnum:]]) # Must contain a symbol
end
