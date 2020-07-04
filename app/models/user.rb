class User < ApplicationRecord
    has_many :chat, dependent: :destroy
    has_many :chatroom, dependent: :destroy
    has_many :chatroom_map, dependent: :destroy

    validates :name, :eyes, :nose, :mouth, :color, presence: true    
end
