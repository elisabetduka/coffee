class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_digest
  has_secure_password
  validates :name, :presence => true,
                    :length => { :minimum => 5 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }

  before_save { |user| user.email = email.downcase }

end
