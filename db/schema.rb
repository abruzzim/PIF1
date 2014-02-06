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

ActiveRecord::Schema.define(:version => 20140206204214) do

  create_table "addresses", :force => true do |t|
    t.string   "strnum",          :limit => 10
    t.string   "addr1",           :limit => 25
    t.string   "addr2",           :limit => 25
    t.string   "city",            :limit => 25
    t.string   "state",           :limit => 2
    t.string   "zip",             :limit => 5
    t.string   "presort",         :limit => 4
    t.integer  "patient_id"
    t.integer  "emer_contact_id"
    t.integer  "pharmacy_id"
    t.integer  "ins_company_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "email_addresses", :force => true do |t|
    t.string   "email",           :limit => 50
    t.string   "type",            :limit => 25
    t.integer  "patient_id"
    t.integer  "emer_contact_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "emer_contacts", :force => true do |t|
    t.string   "fname",      :limit => 25
    t.string   "lname",      :limit => 25
    t.integer  "patient_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "ins_companies", :force => true do |t|
    t.string   "name",         :limit => 50
    t.string   "mbrfname",     :limit => 25
    t.string   "mbrlname",     :limit => 25
    t.string   "mbrid",        :limit => 25
    t.string   "grpnum",       :limit => 25
    t.string   "relationship", :limit => 25
    t.integer  "patient_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "patients", :force => true do |t|
    t.string   "fname",      :limit => 25
    t.string   "lname",      :limit => 25
    t.date     "dob"
    t.string   "gender",     :limit => 1
    t.string   "ssn",        :limit => 9
    t.string   "race",       :limit => 25
    t.string   "ethnicity",  :limit => 25
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "pharmacies", :force => true do |t|
    t.string   "name",       :limit => 50
    t.integer  "patient_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "phone_numbers", :force => true do |t|
    t.string   "areacode",        :limit => 3
    t.string   "prefix",          :limit => 3
    t.string   "number",          :limit => 4
    t.string   "extension",       :limit => 5
    t.integer  "patient_id"
    t.integer  "emer_contact_id"
    t.integer  "pharmacy_id"
    t.integer  "ins_company_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "signatures", :force => true do |t|
    t.boolean  "approved",   :default => false
    t.integer  "patient_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
