# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151006183457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.string  "content"
    t.string  "attachment"
    t.integer "sender_id"
    t.string  "title"
  end

  create_table "messagings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "message_id"
  end

  create_table "taskings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.string   "duedate"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.datetime "image_updated_at"
    t.string   "state"
    t.string   "address"
    t.string   "city"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

end
