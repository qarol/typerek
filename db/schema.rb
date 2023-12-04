# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_12_04_222527) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer "match_id"
    t.integer "user_id"
    t.integer "result"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["match_id", "user_id"], name: "index_answers_on_match_id_and_user_id", unique: true
    t.index ["match_id"], name: "index_answers_on_match_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "match_id"
    t.text "content"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["match_id"], name: "index_comments_on_match_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "team_a", limit: 255
    t.string "team_b", limit: 255
    t.datetime "start", precision: nil
    t.float "win_a"
    t.float "win_b"
    t.float "tie"
    t.float "win_tie_a"
    t.float "win_tie_b"
    t.float "not_tie"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "result_a"
    t.integer "result_b"
  end

  create_table "notifications", force: :cascade do |t|
    t.text "content"
    t.boolean "display", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 255, default: "", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "admin", default: false
    t.datetime "invitation_accepted_at", precision: nil
    t.integer "invited_by_id"
    t.string "invited_by_type", limit: 255
    t.boolean "fin", default: false
    t.string "password_digest"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
