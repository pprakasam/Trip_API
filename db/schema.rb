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

ActiveRecord::Schema.define(version: 2019_04_18_151132) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "examples", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_examples_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name"
    t.string "assigned_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trip_id"
    t.index ["trip_id"], name: "index_items_on_trip_id"
  end

  create_table "tripfamilies", force: :cascade do |t|
    t.string "family"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trip_id"
    t.bigint "user_id"
    t.string "place"
    t.index ["trip_id"], name: "index_tripfamilies_on_trip_id"
    t.index ["user_id"], name: "index_tripfamilies_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "place", null: false
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.date "from_date"
    t.date "to_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "families_joining", default: [], array: true
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "token", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "examples", "users"
  add_foreign_key "items", "trips"
  add_foreign_key "tripfamilies", "trips"
  add_foreign_key "tripfamilies", "users"
  add_foreign_key "trips", "users"
end
