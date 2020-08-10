class User < ApplicationRecord
	has_many :messages
	has_many :chatroom, through: :messages
	# has_many :messages
	has_secure_password
	validates :email, presence: true, uniqueness: true, format: { with: /\b[A-Z0-9._%a-z-]+@(?:[A-Z0-9a-z-]+\.)+[A-Za-z]{2,4}\z/}
	validates :password, presence: true, length: { minimum: 5}
	validates :username, presence: true, length: { minimum: 3}
end
