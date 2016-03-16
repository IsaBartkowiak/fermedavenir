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

ActiveRecord::Schema.define(version: 20160316151622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "generations", force: :cascade do |t|
    t.integer  "semi_from",       default: 0
    t.integer  "semi_to",         default: 0
    t.integer  "plantation"
    t.integer  "recolte"
    t.integer  "conservation_to"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "legume_id"
  end

  create_table "legumes", force: :cascade do |t|
    t.string   "titre"
    t.string   "variete"
    t.string   "caracteristique"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "price"
  end

  create_table "paniers", force: :cascade do |t|
    t.integer  "semaine"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "paniers", ["user_id"], name: "index_paniers_on_user_id", using: :btree

  create_table "portions", force: :cascade do |t|
    t.integer  "panier_id"
    t.integer  "legume_id"
    t.integer  "generation_id"
    t.float    "quantity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "portions", ["generation_id"], name: "index_portions_on_generation_id", using: :btree
  add_index "portions", ["legume_id"], name: "index_portions_on_legume_id", using: :btree

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "paniers", "users"
  add_foreign_key "portions", "generations"
  add_foreign_key "portions", "legumes"
end
