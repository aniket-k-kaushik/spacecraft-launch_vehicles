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

ActiveRecord::Schema[7.0].define(version: 2022_05_24_192408) do
  create_table "launch_vehicles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payload_capacity", default: 0
    t.boolean "reusable", null: false, default: false
  end

  create_table "launches", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "launch_date"
    t.date "launch_description"
    t.bigint "launch_vehicle_id", null: false
    t.bigint "spacecraft_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["launch_vehicle_id"], name: "index_launches_on_launch_vehicle_id"
    t.index ["spacecraft_id"], name: "index_launches_on_spacecraft_id"
  end

  create_table "spacecrafts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "launch_vehicle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weight", default: 0
    t.index ["launch_vehicle_id"], name: "index_spacecrafts_on_launch_vehicle_id"
  end

  add_foreign_key "launches", "launch_vehicles"
  add_foreign_key "launches", "spacecrafts"
  add_foreign_key "spacecrafts", "launch_vehicles"
end
