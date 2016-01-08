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

ActiveRecord::Schema.define(version: 20160107195840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "yugioh_cards", force: :cascade do |t|
    t.string   "name"
    t.text     "text"
    t.string   "card_type"
    t.string   "monster_group"
    t.string   "element"
    t.integer  "attack"
    t.integer  "defense"
    t.integer  "level"
    t.string   "property"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "yugioh_releases", force: :cascade do |t|
    t.integer  "yugioh_card_id"
    t.integer  "yugioh_set_id"
    t.string   "print_tag"
    t.string   "rarity"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "yugioh_sets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
