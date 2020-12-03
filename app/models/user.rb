class User < ApplicationRecord
  include Rails.application.routes.url_helpers # To use url_for() on the custom method at the bottom you need to add this line to allow url_helpers.

  has_secure_password
  has_many :comments
  has_many :issues
  has_many :favorites, dependent: :destroy
  has_many :like_issues, dependent: :destroy
  has_many :like_comments, dependent: :destroy
  has_many :user_skills
  has_many :skills, through: :user_skills
  has_one_attached :profile_picture # This macro sets up a one-to-one mapping between records and files.s

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

  validate :password_cant_be_blank, :if => :password          
  validate :password_lower_case, :if => :password
  validate :password_uppercase, :if => :password
  validate :password_special_char, :if => :password
  validate :password_contains_number, :if => :password            
  validates :password, length: { minimum: 6, maximum: 255 }, :if => :password

  def password_cant_be_blank
    if !!password.present? && password.blank? 
      return errors.add :password, "can't be blank "
    end
  end

  def password_lower_case
    return if !password.blank? && !!password.match(/\p{Lower}/)
    errors.add :password, ' must contain at least 1 uppercase '
  end

  def password_uppercase
    return if !password.blank? && !!password.match(/\p{Upper}/)
    errors.add :password, ' must contain at least 1 lowercase '
  end

  def password_special_char
    special = "?<>',?[]}{=-)(*&^%$#`~{}!"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    return if !password.blank? && password =~ regex
    errors.add :password, ' must contain special character'
  end

  def password_contains_number
    return if !password.blank? && password.count("0-9") > 0
    errors.add :password, ' must contain at least one number'
  end
end
