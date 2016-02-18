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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20160218050728) do

  create_table "addresses", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "street_no"
    t.string   "street_name"
    t.string   "area_name"
    t.string   "landmark"
    t.string   "city"
    t.string   "postal_code"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "addresses", ["customer_id"], :name => "index_addresses_on_customer_id"

  create_table "customers", :force => true do |t|
    t.string   "first_name"
    t.string   "mobile"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "last_name"
  end

  create_table "line_items", :force => true do |t|
    t.string   "sku"
    t.integer  "order_id"
    t.string   "description"
    t.integer  "qty"
    t.float    "price"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "product_name"
    t.integer  "product_id"
  end

  add_index "line_items", ["order_id"], :name => "index_line_items_on_order_id"
  add_index "line_items", ["product_id"], :name => "index_line_items_on_product_id"

  create_table "orders", :force => true do |t|
    t.string   "order_no"
    t.string   "tracking_no"
    t.date     "delivery_date"
    t.boolean  "is_express_delivery"
    t.boolean  "is_customer_pickup"
    t.string   "delivery_slot"
    t.string   "carrier"
    t.string   "order_currency"
    t.integer  "order_value"
    t.string   "payment_collection"
    t.string   "special_instruction"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "customer_id"
    t.integer  "address_id"
  end

  add_index "orders", ["address_id"], :name => "index_orders_on_address_id"
  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "sku"
    t.string   "MFUPC"
    t.float    "cost_price"
    t.float    "retail_price"
    t.string   "storage_type"
    t.integer  "avail_min_qty"
    t.float    "weight"
    t.float    "height"
    t.float    "width"
    t.float    "depth"
    t.integer  "buffer_stock"
    t.boolean  "is_sample"
    t.string   "company"
    t.string   "merchant"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
