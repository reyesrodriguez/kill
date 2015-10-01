class Message < ActiveRecord::Base
	has_many :messagings
	has_many :users, through: :messagings

	validates :title, presence: true
	validates :content, presence: true
end