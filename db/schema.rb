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

ActiveRecord::Schema.define(version: 20151008122536) do

  create_table "cities", force: true do |t|
    t.string   "city_name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["country_id"], name: "index_cities_on_country_id"

  create_table "city_infos", force: true do |t|
    t.text     "body"
    t.string   "language"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "city_infos", ["city_id"], name: "index_city_infos_on_city_id"

  create_table "countries", force: true do |t|
    t.string   "country_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marker_infos", force: true do |t|
    t.text     "body"
    t.string   "language"
    t.integer  "marker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "marker_infos", ["marker_id"], name: "index_marker_infos_on_marker_id"

  create_table "markers", force: true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "markers", ["city_id"], name: "index_markers_on_city_id"

end
