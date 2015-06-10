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

ActiveRecord::Schema.define(version: 20150610114037) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: :cascade do |t|
    t.string   "fs"
    t.string   "iata"
    t.string   "icao"
    t.string   "name"
    t.string   "phone_number"
    t.boolean  "active"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "airlines", ["active"], name: "index_airlines_on_active", using: :btree
  add_index "airlines", ["icao"], name: "index_airlines_on_icao", using: :btree
  add_index "airlines", ["name"], name: "index_airlines_on_name", using: :btree

  create_table "flight_details", force: :cascade do |t|
    t.string   "arrival_airport_fs_code"
    t.float    "arrival_airport_latitude"
    t.float    "arrival_airport_longitude"
    t.datetime "arrival_date_local"
    t.datetime "arrival_date_utc"
    t.string   "departure_airport_fs_code"
    t.float    "departure_airport_latitude"
    t.float    "departure_airport_longitude"
    t.datetime "departure_date_local"
    t.datetime "departure_date_utc"
    t.integer  "flight_duration"
    t.float    "flight_distance"
    t.integer  "flight_id"
    t.string   "flight_number"
    t.datetime "scheduled_gate_arrival_local"
    t.datetime "scheduled_gate_arrival_utc"
    t.datetime "scheduled_gate_departure_local"
    t.datetime "scheduled_gate_departure_utc"
    t.string   "status"
    t.integer  "trip_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "flight_details", ["flight_id"], name: "index_flight_details_on_flight_id", using: :btree
  add_index "flight_details", ["trip_id"], name: "index_flight_details_on_trip_id", using: :btree

  create_table "trips", force: :cascade do |t|
    t.datetime "departure_date"
    t.string   "flight_number"
    t.integer  "flight_id"
    t.text     "status"
    t.integer  "user_id"
    t.integer  "airline_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "trips", ["airline_id"], name: "index_trips_on_airline_id", using: :btree
  add_index "trips", ["departure_date"], name: "index_trips_on_departure_date", using: :btree
  add_index "trips", ["flight_id"], name: "index_trips_on_flight_id", using: :btree
  add_index "trips", ["flight_number"], name: "index_trips_on_flight_number", using: :btree
  add_index "trips", ["user_id"], name: "index_trips_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["first_name"], name: "index_users_on_first_name", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "whitelists", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "flight_details", "trips"
end
