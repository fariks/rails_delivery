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

ActiveRecord::Schema.define(version: 20161012192834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "rawLine1"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "name"
    t.integer  "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_drivers_on_vehicle_id", using: :btree
  end

  create_table "loads", force: :cascade do |t|
    t.date     "deliveryDate"
    t.string   "deliveryShift"
    t.integer  "driver_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["driver_id"], name: "index_loads_on_driver_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "load_id"
    t.date     "deliveryDate"
    t.string   "deliveryShift"
    t.string   "originName"
    t.string   "clientName"
    t.string   "phoneNumber"
    t.string   "mode"
    t.integer  "purchaseOrderNumber"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "origin_address_id"
    t.integer  "destination_address_id"
    t.float    "volume"
    t.integer  "handlingUnitQuantity"
    t.string   "handlingUnitType"
    t.index ["load_id"], name: "index_orders_on_load_id", using: :btree
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "vehicleType"
    t.integer  "maxVolume"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "drivers", "vehicles"
  add_foreign_key "loads", "drivers"
  add_foreign_key "orders", "loads"
end
