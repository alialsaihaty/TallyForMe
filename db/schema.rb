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

ActiveRecord::Schema.define(version: 20150927002819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "address_kind"
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.string   "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoiced_items", force: :cascade do |t|
    t.integer  "invoice_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "invoiced_items", ["invoice_id"], name: "index_invoiced_items_on_invoice_id", using: :btree
  add_index "invoiced_items", ["item_id"], name: "index_invoiced_items_on_item_id", using: :btree

  create_table "invoiced_services", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "invoiced_services", ["invoice_id"], name: "index_invoiced_services_on_invoice_id", using: :btree
  add_index "invoiced_services", ["service_id"], name: "index_invoiced_services_on_service_id", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.string   "invoice_number"
    t.datetime "invoice_date"
    t.float    "subtotal"
    t.integer  "tax1"
    t.integer  "tax2"
    t.boolean  "is_paid"
    t.string   "payment_kind"
    t.datetime "payment_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "items", force: :cascade do |t|
    t.text     "description"
    t.string   "sku"
    t.string   "qty"
    t.decimal  "price"
    t.integer  "discount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "company_id"
  end

  add_index "items", ["company_id"], name: "index_items_on_company_id", using: :btree

  create_table "phones", force: :cascade do |t|
    t.string   "phone_number"
    t.string   "country_code"
    t.string   "ext"
    t.string   "is_default"
    t.string   "mobile"
    t.integer  "phonable_id"
    t.string   "phonable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "phone_kind"
  end

  add_index "phones", ["phonable_type", "phonable_id"], name: "index_phones_on_phonable_type_and_phonable_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "unit"
    t.integer  "tax1"
    t.integer  "tax2"
    t.text     "description"
    t.decimal  "cost"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "is_active"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "admin",           default: true
    t.string   "user_kind"
    t.integer  "company_id"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "invoiced_items", "invoices"
  add_foreign_key "invoiced_items", "items"
  add_foreign_key "invoiced_services", "invoices"
  add_foreign_key "invoiced_services", "services"
  add_foreign_key "items", "companies"
  add_foreign_key "users", "companies"
end
