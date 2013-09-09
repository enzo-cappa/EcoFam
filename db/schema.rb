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

ActiveRecord::Schema.define(version: 20130909182800) do

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "market_brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "markets", force: true do |t|
    t.string   "name"
    t.integer  "market_brand_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "measure_units", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "periods", force: true do |t|
    t.integer  "year"
    t.integer  "month"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "periods", ["year", "month"], name: "index_periods_on_year_and_month", unique: true

  create_table "price_lines", force: true do |t|
    t.integer  "product_id"
    t.integer  "purchase_id"
    t.decimal  "quantity"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "brand_id"
    t.decimal  "price",       precision: 10, scale: 2, default: 0.0
    t.decimal  "subtotal",    precision: 10, scale: 2, default: 0.0
    t.string   "type"
    t.date     "date"
    t.integer  "market_id"
  end

  add_index "price_lines", ["type"], name: "index_price_lines_on_type"

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "measure_unit_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "purchases", force: true do |t|
    t.decimal  "total",         precision: 10, scale: 2, default: 0.0
    t.integer  "market_id"
    t.date     "purchase_date"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "period_id"
    t.integer  "user_group_id"
    t.integer  "user_id"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories"

  create_table "spends", force: true do |t|
    t.string   "titulo"
    t.decimal  "amount"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "spend_date"
    t.integer  "period_id"
    t.integer  "user_group_id"
    t.integer  "user_id"
  end

  create_table "tag_lines", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",               default: "",    null: false
    t.string   "encrypted_password",  default: "",    null: false
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "user_group_id"
    t.boolean  "admin",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "varietes", force: true do |t|
    t.string   "name"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
