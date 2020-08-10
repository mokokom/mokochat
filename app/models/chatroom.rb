class Chatroom < ApplicationRecord
	has_many :messages
	has_many :users, through: :messages
	# has_many :messages
	validates :name, presence: true, length: { minimum: 3, maximum: 15 }
end
