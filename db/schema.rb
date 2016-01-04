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

ActiveRecord::Schema.define(version: 20151216102436) do

  create_table "cities", force: true do |t|
    t.string   "city_name"
    t.integer  "country_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "city_images"
    t.text     "city_images_2"
    t.text     "city_images_3"
    t.text     "city_images_4"
  end

  add_index "cities", ["country_id"], name: "index_cities_on_country_id"

  create_table "city_infos", force: true do |t|
    t.text     "body"
    t.string   "language"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "city_audio"
    t.string   "name"
  end

  add_index "city_infos", ["city_id"], name: "index_city_infos_on_city_id"

  create_table "countries", force: true do |t|
    t.string   "country_name_nld"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_name_eng"
    t.string   "country_name_esp"
  end

  create_table "marker_infos", force: true do |t|
    t.text     "body"
    t.string   "language"
    t.integer  "marker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "marker_audio"
    t.string   "name"
  end

  add_index "marker_infos", ["marker_id"], name: "index_marker_infos_on_marker_id"

  create_table "markers", force: true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "marker_images"
    t.text     "marker_images_2"
    t.text     "marker_images_3"
    t.text     "marker_images_4"
    t.float    "marker_lng"
    t.float    "marker_lat"
    t.integer  "marker_type"
    t.boolean  "icon_only"
  end

  add_index "markers", ["city_id"], name: "index_markers_on_city_id"

  create_table "markers_routes", force: true do |t|
    t.integer  "marker_id",  null: false
    t.integer  "route_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "routes", force: true do |t|
    t.decimal  "afstand"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "multiple_starting_points"
    t.string   "name_nld"
    t.text     "info_nld"
    t.string   "name_eng"
    t.text     "info_eng"
    t.string   "name_esp"
    t.text     "info_esp"
  end

  add_index "routes", ["city_id"], name: "index_routes_on_city_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
