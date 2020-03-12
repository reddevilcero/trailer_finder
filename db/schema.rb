# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_11_195312) do

  create_table "depots", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.string "comments"
    t.integer "worker_id"
    t.integer "start_depot_id"
    t.integer "end_depot_id"
    t.integer "trailer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_depot_id"], name: "index_shifts_on_end_depot_id"
    t.index ["start_depot_id"], name: "index_shifts_on_start_depot_id"
  end

  create_table "trailers", force: :cascade do |t|
    t.string "identifier"
    t.string "make"
    t.boolean "vor"
    t.date "mot_date"
    t.integer "depot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "is_admin?", default: false
    t.string "rol", default: "driver"
    t.string "seniority"
    t.string "license"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "depot_id"
    t.index ["email"], name: "index_workers_on_email", unique: true
  end

end
