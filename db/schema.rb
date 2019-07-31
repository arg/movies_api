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

ActiveRecord::Schema.define(version: 2019_07_22_125801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "episodes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "season_id", null: false
    t.string "title", limit: 160, null: false
    t.string "plot", limit: 500, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", null: false
    t.index ["season_id"], name: "index_episodes_on_season_id"
  end

  create_table "items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type", null: false
    t.string "title", limit: 160, null: false
    t.string "plot", limit: 500, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_items_on_type"
  end

  create_table "purchases", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "item_id", null: false
    t.integer "option", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "expires_at", null: false
    t.index ["expires_at"], name: "index_purchases_on_expires_at"
    t.index ["item_id"], name: "index_purchases_on_item_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", limit: 160, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "lower((email)::text)", name: "index_users_on_lower_email", unique: true
  end

  add_foreign_key "episodes", "items", column: "season_id", on_delete: :cascade
  add_foreign_key "purchases", "items", on_delete: :cascade
  add_foreign_key "purchases", "users", on_delete: :cascade
end
