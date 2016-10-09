class User < ApplicationRecord
	before_save { self.email = email.downcase }
	validates :name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true
	validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness:  { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }
	has_secure_password
end
