class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	has_many :taskings
	has_many :tasks, through: :taskings
	has_many :messagings
	has_many :messages, through: :messagings

	validates :name, presence: true,
					 uniqueness: { case_sensitive: false }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,presence: true,
					 uniqueness: { case_sensitive: false },
					 format: {with: VALID_EMAIL_REGEX}

	validates :password, presence: true
	validates :password_confirmation, confirmation: true

	has_secure_password
end