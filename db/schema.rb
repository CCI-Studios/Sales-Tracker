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

ActiveRecord::Schema.define(:version => 20111104185155) do

  create_table "attempts", :force => true do |t|
    t.datetime "time"
    t.integer  "user_id"
    t.boolean  "email"
    t.boolean  "phone"
    t.boolean  "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.integer  "campaign_id"
    t.boolean  "success"
    t.integer  "value"
    t.integer  "carrot"
    t.integer  "off_campus",                :default => 0, :null => false
    t.integer  "off_campus_featured",       :default => 0, :null => false
    t.integer  "restaurant",                :default => 0, :null => false
    t.integer  "restaurant_featured",       :default => 0, :null => false
    t.integer  "services",                  :default => 0, :null => false
    t.integer  "services_featured",         :default => 0, :null => false
    t.integer  "email_blast",               :default => 0, :null => false
    t.integer  "ads",                       :default => 0, :null => false
    t.integer  "off_campus_value",          :default => 0, :null => false
    t.integer  "off_campus_featured_value", :default => 0, :null => false
    t.integer  "restaurant_value",          :default => 0, :null => false
    t.integer  "restaurant_featured_value", :default => 0, :null => false
    t.integer  "services_value",            :default => 0, :null => false
    t.integer  "services_featured_value",   :default => 0, :null => false
    t.integer  "email_blast_value",         :default => 0, :null => false
    t.integer  "ads_value",                 :default => 0, :null => false
  end

  create_table "campaigns", :force => true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
