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

ActiveRecord::Schema.define(version: 20160812205553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "farms", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "location"
    t.boolean  "tutorial",   default: true
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "generations", force: :cascade do |t|
    t.integer  "seedling_from", default: 0
    t.integer  "seedling_to",   default: 0
    t.integer  "plantation"
    t.integer  "harvest"
    t.integer  "available_for"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "plant_id"
    t.integer  "farm_id"
  end

  add_index "generations", ["farm_id"], name: "index_generations_on_farm_id", using: :btree

  create_table "hampers", force: :cascade do |t|
    t.integer  "semaine"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.integer  "farm_id"
    t.integer  "quantity",   default: 20
  end

  add_index "hampers", ["farm_id"], name: "index_hampers_on_farm_id", using: :btree
  add_index "hampers", ["user_id"], name: "index_hampers_on_user_id", using: :btree

  create_table "plantations", force: :cascade do |t|
    t.integer  "farm_id"
    t.integer  "generation_id"
    t.float    "quantity"
    t.integer  "year"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "plantations", ["farm_id"], name: "index_plantations_on_farm_id", using: :btree
  add_index "plantations", ["generation_id"], name: "index_plantations_on_generation_id", using: :btree

  create_table "plants", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.string   "feature"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.float    "price"
    t.integer  "farm_id"
    t.float    "nb_per_kilo", default: 1000.0
  end

  add_index "plants", ["farm_id"], name: "index_plants_on_farm_id", using: :btree

  create_table "plots", force: :cascade do |t|
    t.string   "location"
    t.integer  "generation_id"
    t.integer  "farm_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
  end

  add_index "plots", ["farm_id"], name: "index_plots_on_farm_id", using: :btree
  add_index "plots", ["generation_id"], name: "index_plots_on_generation_id", using: :btree

  create_table "portions", force: :cascade do |t|
    t.integer  "hamper_id"
    t.integer  "plant_id"
    t.integer  "generation_id"
    t.float    "quantity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "portions", ["generation_id"], name: "index_portions_on_generation_id", using: :btree
  add_index "portions", ["plant_id"], name: "index_portions_on_plant_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "farm_id"
    t.string   "status",                 default: "farmer"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["farm_id"], name: "index_users_on_farm_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "generations", "farms"
  add_foreign_key "hampers", "farms"
  add_foreign_key "hampers", "users"
  add_foreign_key "plantations", "farms"
  add_foreign_key "plantations", "generations"
  add_foreign_key "plants", "farms"
  add_foreign_key "plots", "farms"
  add_foreign_key "plots", "generations"
  add_foreign_key "portions", "generations"
  add_foreign_key "portions", "plants"
  add_foreign_key "users", "farms"
end
