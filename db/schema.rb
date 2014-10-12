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

ActiveRecord::Schema.define(version: 20141012181020) do

  create_table "devices", force: true do |t|
    t.string   "name"
    t.integer  "uid"
    t.integer  "reports_count"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.integer  "update_period"
  end

  create_table "reports", force: true do |t|
    t.integer  "device_id"
    t.string   "token"
    t.integer  "temperature"
    t.integer  "pressure"
    t.integer  "humidity"
    t.integer  "wind_speed"
    t.integer  "wind_direction"
    t.integer  "rainfall"
    t.integer  "light_level"
    t.integer  "battery_level"
    t.datetime "record_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
