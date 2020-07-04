class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :text, :user, :chatroom, presence: true
end
