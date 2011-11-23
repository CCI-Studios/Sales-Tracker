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

ActiveRecord::Schema.define(:version => 20111123055433) do

  create_table "attempts", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "email"
    t.boolean  "phone"
    t.boolean  "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.integer  "campaign_id"
    t.boolean  "verbal"
    t.integer  "value"
  end

  create_table "campaigns", :force => true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "goal"
  end

  create_table "companies", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "user_id"
  end

  create_table "sales", :force => true do |t|
    t.integer  "total"
    t.integer  "company_id"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "carrot"
    t.integer  "off_campus",                   :default => 0, :null => false
    t.integer  "off_campus_value",             :default => 0, :null => false
    t.integer  "off_campus_duration",          :default => 0, :null => false
    t.integer  "off_campus_featured",          :default => 0, :null => false
    t.integer  "off_campus_featured_value",    :default => 0, :null => false
    t.integer  "off_campus_featured_duration", :default => 0, :null => false
    t.integer  "restaurant",                   :default => 0, :null => false
    t.integer  "restaurant_value",             :default => 0, :null => false
    t.integer  "restaurant_duration",          :default => 0, :null => false
    t.integer  "restaurant_featured",          :default => 0, :null => false
    t.integer  "restaurant_featured_value",    :default => 0, :null => false
    t.integer  "restaurant_featured_duration", :default => 0, :null => false
    t.integer  "services",                     :default => 0, :null => false
    t.integer  "services_value",               :default => 0, :null => false
    t.integer  "services_duration",            :default => 0, :null => false
    t.integer  "services_featured",            :default => 0, :null => false
    t.integer  "services_featured_value",      :default => 0, :null => false
    t.integer  "services_featured_duration",   :default => 0, :null => false
    t.integer  "email_blast",                  :default => 0, :null => false
    t.integer  "email_blast_value",            :default => 0, :null => false
    t.integer  "ads",                          :default => 0, :null => false
    t.integer  "ads_value",                    :default => 0, :null => false
    t.integer  "off_campus_carrots",           :default => 0, :null => false
    t.integer  "restaurant_carrots",           :default => 0, :null => false
    t.integer  "service_carrots",              :default => 0, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",             :default => false
  end

end
