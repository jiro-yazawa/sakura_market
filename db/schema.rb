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

ActiveRecord::Schema.define(version: 2019_08_10_093502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "added_items", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "item_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_added_items_on_cart_id"
    t.index ["item_id"], name: "index_added_items_on_item_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "location"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "cash_on_deliveries", force: :cascade do |t|
    t.integer "fee"
    t.integer "orders_total_price_begin"
    t.integer "orders_total_price_end"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "price"
    t.text "description"
    t.boolean "hidden"
    t.integer "display_order"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.string "user_name"
    t.text "user_location"
    t.integer "total_price"
    t.integer "subtotal"
    t.integer "tax_fee"
    t.integer "cash_on_delivery"
    t.integer "delivery_fee"
    t.datetime "delivery_date"
    t.string "delivery_timezone"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "price"
    t.text "description"
    t.boolean "hidden"
    t.integer "display_order"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "user_id"
    t.string "user_name", null: false
    t.text "user_location"
    t.integer "total_fee", default: 0
    t.integer "subtotal", default: 0
    t.integer "tax_fee", default: 0
    t.datetime "created_at", default: "2019-08-08 09:28:21"
    t.integer "cash_on_delivery", default: 0
    t.integer "delivery_fee", default: 0
    t.datetime "delivery_date"
    t.string "delivery_timezone"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "taxes", force: :cascade do |t|
    t.decimal "rate"
    t.date "active_date_begin"
    t.date "active_date_end"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "added_items", "carts"
  add_foreign_key "added_items", "items"
  add_foreign_key "addresses", "users"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
  add_foreign_key "carts", "users"
end
