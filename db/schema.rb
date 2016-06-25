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

ActiveRecord::Schema.define(version: 20160625064722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "milk_attributes", force: :cascade do |t|
    t.string   "value"
    t.integer  "milk_product_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "milk_attributes", ["milk_product_id"], name: "index_milk_attributes_on_milk_product_id", using: :btree

  create_table "milk_brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "milk_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "milk_extra_attributes", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "milk_product_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "milk_extra_attributes", ["milk_product_id"], name: "index_milk_extra_attributes_on_milk_product_id", using: :btree

  create_table "milk_product_images", force: :cascade do |t|
    t.integer  "milk_product_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "milk_product_images", ["milk_product_id"], name: "index_milk_product_images_on_milk_product_id", using: :btree

  create_table "milk_products", force: :cascade do |t|
    t.string   "name"
    t.string   "bibomart_sku"
    t.integer  "price"
    t.integer  "milk_brand_id"
    t.integer  "milk_category_id"
    t.text     "detail"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "milk_products", ["milk_brand_id"], name: "index_milk_products_on_milk_brand_id", using: :btree
  add_index "milk_products", ["milk_category_id"], name: "index_milk_products_on_milk_category_id", using: :btree

  add_foreign_key "milk_attributes", "milk_products"
  add_foreign_key "milk_extra_attributes", "milk_products"
  add_foreign_key "milk_product_images", "milk_products"
  add_foreign_key "milk_products", "milk_brands"
  add_foreign_key "milk_products", "milk_categories"
end