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

ActiveRecord::Schema.define(version: 20140916072634) do

  create_table "devices", force: true do |t|
    t.string   "name"
    t.integer  "width"
    t.integer  "height"
    t.string   "os"
    t.string   "preview_image"
    t.string   "vertical_bg"
    t.string   "horizontal_bg"
    t.string   "screen_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "devices", ["name"], name: "index_devices_on_name", using: :btree

  create_table "site_contacts", force: true do |t|
    t.integer  "site_id"
    t.string   "email"
    t.string   "qq"
    t.string   "phone"
    t.string   "is_processed", default: "n"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_contacts", ["is_processed"], name: "index_site_contacts_on_is_processed", using: :btree
  add_index "site_contacts", ["site_id"], name: "index_site_contacts_on_site_id", using: :btree

  create_table "sites", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.string   "keywords"
    t.text     "description"
    t.string   "is_processed", default: "n"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["is_processed"], name: "index_sites_on_is_processed", using: :btree
  add_index "sites", ["url"], name: "index_sites_on_url", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
