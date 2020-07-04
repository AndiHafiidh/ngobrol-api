class Chatroom < ApplicationRecord
  belongs_to :user
  has_many :chats, dependent: :destroy
  has_many :chatroom_maps, dependent: :destroy

  validates :name, :user, presence: true
end
