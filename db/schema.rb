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

ActiveRecord::Schema.define(version: 20150612214119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airlines", force: :cascade do |t|
    t.string   "fs"
    t.string   "iata"
    t.string   "icao"
    t.string   "name"
    t.string   "phone_number"
    t.boolean  "active"
    t.string   "slug"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "airlines", ["active"], name: "index_airlines_on_active", using: :btree
  add_index "airlines", ["icao"], name: "index_airlines_on_icao", using: :btree
  add_index "airlines", ["name"], name: "index_airlines_on_name", using: :btree
  add_index "airlines", ["slug"], name: "index_airlines_on_slug", unique: true, using: :btree

  create_table "airports", force: :cascade do |t|
    t.string   "city"
    t.string   "city_code"
    t.integer  "classification"
    t.string   "country_code"
    t.string   "country_name"
    t.string   "delay_index_url"
    t.integer  "elevation_feet"
    t.string   "faa"
    t.string   "fs"
    t.string   "href"
    t.string   "iata"
    t.string   "icao"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
    t.string   "postal_code"
    t.string   "region_name"
    t.string   "state_code"
    t.string   "street"
    t.string   "time_zone_region_name"
    t.float    "utc_offset_hours"
    t.string   "weather_url"
    t.string   "weather_zone"
    t.string   "slug"
    t.integer  "flight_detail_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "airports", ["city"], name: "index_airports_on_city", using: :btree
  add_index "airports", ["flight_detail_id"], name: "index_airports_on_flight_detail_id", using: :btree
  add_index "airports", ["iata"], name: "index_airports_on_iata", using: :btree
  add_index "airports", ["slug"], name: "index_airports_on_slug", unique: true, using: :btree

  create_table "airports_trips", id: false, force: :cascade do |t|
    t.integer "airport_id", null: false
    t.integer "trip_id",    null: false
  end

  add_index "airports_trips", ["airport_id", "trip_id"], name: "index_airports_trips_on_airport_id_and_trip_id", using: :btree
  add_index "airports_trips", ["trip_id", "airport_id"], name: "index_airports_trips_on_trip_id_and_airport_id", using: :btree

  create_table "flight_details", force: :cascade do |t|
    t.string   "arrival_airport_fs_code"
    t.string   "departure_airport_fs_code"
    t.datetime "arrival_date_local"
    t.datetime "arrival_date_utc"
    t.string   "carrier_fs_code"
    t.datetime "departure_date_local"
    t.datetime "departure_date_utc"
    t.integer  "scheduled_block_minutes"
    t.string   "scheduled_equipment_iata_code"
    t.integer  "flight_id"
    t.string   "flight_number"
    t.datetime "published_local_arrival"
    t.datetime "published_utc_arrival"
    t.datetime "published_departure_local"
    t.datetime "published_departure_utc"
    t.datetime "scheduled_gate_arrival_local"
    t.datetime "scheduled_gate_arrival_utc"
    t.datetime "scheduled_gate_departure_local"
    t.datetime "scheduled_gate_departure_utc"
    t.string   "flight_type"
    t.string   "service_classes"
    t.string   "status"
    t.integer  "trip_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "flight_details", ["flight_id"], name: "index_flight_details_on_flight_id", using: :btree
  add_index "flight_details", ["trip_id"], name: "index_flight_details_on_trip_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "trips", force: :cascade do |t|
    t.datetime "departure_date"
    t.text     "status"
    t.string   "flight_number"
    t.string   "slug"
    t.integer  "user_id"
    t.integer  "airline_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "trips", ["airline_id"], name: "index_trips_on_airline_id", using: :btree
  add_index "trips", ["departure_date"], name: "index_trips_on_departure_date", using: :btree
  add_index "trips", ["slug"], name: "index_trips_on_slug", unique: true, using: :btree
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
    t.string   "slug"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

  create_table "whitelists", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "airports", "flight_details"
  add_foreign_key "flight_details", "trips"
end
