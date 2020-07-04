class CreateChatroomMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :chatroom_maps do |t|
      t.references :chatroom, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
