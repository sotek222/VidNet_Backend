# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_02_001952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friends", force: :cascade do |t|
    t.integer "friender_id"
    t.integer "friendee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inboxes", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_inboxes_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "inbox_id"
    t.integer "sender_id"
    t.string "link"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inbox_id"], name: "index_messages_on_inbox_id"
  end

  create_table "theatre_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "theatre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["theatre_id"], name: "index_theatre_users_on_theatre_id"
    t.index ["user_id"], name: "index_theatre_users_on_user_id"
  end

  create_table "theatres", force: :cascade do |t|
    t.integer "host_id"
    t.string "src"
    t.boolean "text_chat"
    t.boolean "audio_chat"
    t.boolean "video_chat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "playing"
    t.boolean "muted"
    t.integer "elapsed_time"
    t.boolean "is_public"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "image"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "inboxes", "users"
  add_foreign_key "messages", "inboxes"
  add_foreign_key "theatre_users", "theatres"
  add_foreign_key "theatre_users", "users"
end
