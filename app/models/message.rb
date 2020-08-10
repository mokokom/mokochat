class Message < ApplicationRecord
	belongs_to :user
	belongs_to :chatroom
	validates :content, presence: true
	scope :custom_display, -> { order(:created_at).last(2) }
end
