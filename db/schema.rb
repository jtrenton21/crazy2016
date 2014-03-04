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

ActiveRecord::Schema.define(:version => 20140303214615) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "published"
    t.string   "photo"
    t.string   "link"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contents", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "info"
    t.string   "source"
    t.string   "photo"
    t.integer  "visit_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "approved",           :default => false
  end

  add_index "contents", ["visit_id"], :name => "index_contents_on_visit_id"

  create_table "eventdays", :force => true do |t|
    t.string   "day"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "month"
    t.string   "year"
    t.string   "date"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "einfo"
    t.string   "start_time"
    t.string   "address"
    t.date     "weekday"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.time     "end_at"
    t.integer  "eventday_id"
  end

  add_index "events", ["eventday_id"], :name => "index_events_on_eventday_id"

  create_table "orders", :force => true do |t|
    t.integer  "quantity"
    t.decimal  "amount",     :precision => 10, :scale => 0
    t.string   "status"
    t.integer  "ticket_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "orders", ["ticket_id"], :name => "index_orders_on_ticket_id"

  create_table "partners", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "photo"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "amount"
    t.string   "token"
    t.string   "indentifier"
    t.string   "payer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.decimal  "price"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "payment_id"
  end

  add_index "products", ["category_id"], :name => "index_products_on_category_id"

  create_table "slides", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "tickets", :force => true do |t|
    t.string   "event"
    t.string   "date"
    t.string   "time"
    t.decimal  "price"
    t.string   "description"
    t.integer  "event_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "tickets", ["event_id"], :name => "index_tickets_on_event_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "visits", :force => true do |t|
    t.string   "location"
    t.string   "vdate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
