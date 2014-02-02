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

ActiveRecord::Schema.define(:version => 20140201205305) do

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
    t.time     "start_time"
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

  create_table "link_preview_parsers", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "migrations", :force => true do |t|
  end

  create_table "payments", :force => true do |t|
    t.integer  "amount",     :default => 1
    t.string   "token"
    t.string   "identifier"
    t.string   "payer_id"
    t.boolean  "recurring",  :default => false
    t.boolean  "digital",    :default => true
    t.boolean  "popup",      :default => false
    t.boolean  "completed",  :default => false
    t.boolean  "canceled",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

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
