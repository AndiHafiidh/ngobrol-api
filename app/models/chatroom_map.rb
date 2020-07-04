class ChatroomMap < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :chatroom, :user, presence: true
end
