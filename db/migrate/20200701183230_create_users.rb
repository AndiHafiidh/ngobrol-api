class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :eyes
      t.string :nose
      t.string :mouth
      t.string :color
      t.string :firebase_id

      t.timestamps
    end
  end
end
