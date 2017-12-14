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

ActiveRecord::Schema.define(version: 20171213233751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lines", force: :cascade do |t|
    t.string "train"
    t.string "color"
    t.string "borough"
    t.text   "description"
  end

  create_table "passengers", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "passenger_name"
  end

  create_table "passengers_trips", id: false, force: :cascade do |t|
    t.integer "trip_id",      null: false
    t.integer "passenger_id", null: false
  end

  add_index "passengers_trips", ["passenger_id", "trip_id"], name: "index_passengers_trips_on_passenger_id_and_trip_id", using: :btree
  add_index "passengers_trips", ["trip_id", "passenger_id"], name: "index_passengers_trips_on_trip_id_and_passenger_id", using: :btree

  create_table "stops", force: :cascade do |t|
    t.string "stop"
  end

  create_table "trips", force: :cascade do |t|
    t.string   "Train Line"
    t.string   "Passenger"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "passenger_id"
    t.string   "passenger_name"
    t.string   "train"
    t.datetime "timestamps"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
