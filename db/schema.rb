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

ActiveRecord::Schema[7.1].define(version: 2024_09_27_084318) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.integer "seat_no"
    t.string "bookable_type", null: false
    t.bigint "bookable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bookable_type", "bookable_id"], name: "index_bookings_on_bookable"
  end

  create_table "buses", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.time "departure_time"
    t.time "arrival_time"
    t.integer "directions_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "directions", force: :cascade do |t|
    t.string "source"
    t.string "destination"
    t.string "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trains", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.time "departure_time"
    t.time "arrival_time"
    t.integer "direction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
