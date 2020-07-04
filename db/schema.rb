# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_03_141349) do

  create_table "chatroom_maps", force: :cascade do |t|
    t.integer "chatroom_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_chatroom_maps_on_chatroom_id"
    t.index ["user_id"], name: "index_chatroom_maps_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_chatrooms_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string "text"
    t.integer "user_id", null: false
    t.integer "chatroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_chats_on_chatroom_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "eyes"
    t.string "nose"
    t.string "mouth"
    t.string "color"
    t.string "firebase_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "chatroom_maps", "chatrooms"
  add_foreign_key "chatroom_maps", "users"
  add_foreign_key "chatrooms", "users"
  add_foreign_key "chats", "chatrooms"
  add_foreign_key "chats", "users"
end
