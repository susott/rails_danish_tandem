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

ActiveRecord::Schema.define(version: 20180524084343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "language_skills", force: :cascade do |t|
    t.integer "score"
    t.bigint "user_id"
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_language_skills_on_language_id"
    t.index ["user_id"], name: "index_language_skills_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "dialect"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefered_meeting_times", force: :cascade do |t|
    t.string "options"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_prefered_meeting_times_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.integer "age"
    t.string "name"
    t.string "phone_number"
    t.text "description"
    t.string "dedication"
    t.string "from_country"
    t.string "gender"
    t.string "photo"
    t.string "username"
    t.string "street"
    t.boolean "native_dane", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "language_skills", "languages"
  add_foreign_key "language_skills", "users"
  add_foreign_key "prefered_meeting_times", "users"
end
