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

ActiveRecord::Schema.define(version: 201801041652403) do

  create_table "answers", force: :cascade do |t|
    t.string "text"
    t.string "question_text"
    t.integer "survey_id"
    t.integer "question_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bot_messages", force: :cascade do |t|
    t.string "text"
    t.string "from"
    t.string "info"
    t.string "user"
    t.integer "chat"
    t.string "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.string "type"
    t.string "options"
    t.integer "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.string "name"
    t.string "summary"
    t.integer "active"
    t.integer "default"
    t.integer "points"
    t.integer "capacity"
    t.integer "passed_times"
    t.text "detail"
    t.datetime "active_to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "plan"
    t.string "type"
    t.string "referred_by"
    t.string "referral_id"
    t.string "language"
    t.string "stage"
    t.string "photo"
    t.string "phone_number"
    t.string "taken_surveys"
    t.integer "chat_id"
    t.integer "banned"
    t.integer "points"
    t.integer "rank"
    t.datetime "last_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
