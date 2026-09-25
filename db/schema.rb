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

ActiveRecord::Schema[8.1].define(version: 2026_09_29_184849) do
  create_table "participants", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_participants_on_email", unique: true
  end

  create_table "registrations", force: :cascade do |t|
    t.integer "session_id", null: false
    t.integer "participant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_registrations_on_participant_id"
    t.index ["session_id", "participant_id"], name: "index_registrations_on_session_id_and_participant_id", unique: true
    t.index ["session_id"], name: "index_registrations_on_session_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "workshop_id", null: false
    t.datetime "starts_at", null: false
    t.integer "capacity", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workshop_id"], name: "index_sessions_on_workshop_id"
  end

  create_table "workshops", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.integer "duration_minutes"
    t.boolean "published", default: false, null: false
  end

  add_foreign_key "registrations", "participants"
  add_foreign_key "registrations", "sessions"
  add_foreign_key "sessions", "workshops"
end
