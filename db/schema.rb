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

ActiveRecord::Schema.define(version: 20130710113321) do

  create_table "consultant_customer_destinations", force: true do |t|
    t.integer  "vacation_consultant_id"
    t.integer  "customer_id"
    t.integer  "cust_iti_header_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cust_iti_details", force: true do |t|
    t.integer  "cust_iti_header_id"
    t.integer  "destination_id"
    t.integer  "destination_group_id"
    t.date     "dest_start_date"
    t.date     "dest_end_date"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cust_iti_headers", force: true do |t|
    t.string   "cust_iti_name"
    t.string   "iti_type"
    t.integer  "vacation_type_id"
    t.date     "trip_start_date"
    t.date     "trip_end_date"
    t.string   "seasons"
    t.integer  "duration"
    t.integer  "no_of_adults"
    t.integer  "no_of_children",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  create_table "cust_iti_requests", force: true do |t|
    t.integer  "customer_id"
    t.string   "dest_type"
    t.string   "destinations"
    t.integer  "vacation_type_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "no_of_adults"
    t.integer  "no_of_children"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "lphone"
    t.string   "mphone"
    t.string   "email"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dest_iti_details", force: true do |t|
    t.integer  "dest_iti_header_id"
    t.integer  "points_of_attraction_id"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dest_iti_headers", force: true do |t|
    t.string   "dest_iti_name"
    t.integer  "destination_id"
    t.integer  "day_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destinations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "iti_cust_dest_details", force: true do |t|
    t.integer  "cust_iti_detail_id"
    t.integer  "dest_iti_detail_id"
    t.time     "preferred_time_of_arrival"
    t.time     "preferred_time_of_departure"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "iti_cust_dest_poa_details", force: true do |t|
    t.integer  "cust_iti_detail_id"
    t.integer  "dest_iti_detail_id"
    t.integer  "points_of_attraction_id"
    t.time     "preferred_time_of_arrival"
    t.time     "preferred_time_of_departure"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "day_number"
  end

  create_table "iti_day_details", force: true do |t|
    t.integer  "iti_header_id"
    t.integer  "day_number"
    t.integer  "points_of_attraction_id"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "iti_destination_xrefs", force: true do |t|
    t.integer  "iti_header_id"
    t.integer  "destination_id"
    t.integer  "destination_group_id"
    t.date     "dest_start_date"
    t.date     "dest_end_date"
    t.string   "season"
    t.integer  "duration"
    t.integer  "no_of_people"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "iti_details", force: true do |t|
    t.integer  "iti_header_id"
    t.integer  "destination_id"
    t.integer  "day_number"
    t.integer  "property_id"
    t.date     "iti_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "iti_headers", force: true do |t|
    t.string   "name"
    t.string   "iti_type"
    t.integer  "vacation_type_id"
    t.date     "iti_start_date"
    t.date     "iti_end_date"
    t.string   "season"
    t.integer  "duration"
    t.integer  "no_of_people"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pg_search_documents", force: true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poa_types", force: true do |t|
    t.string   "poa_type"
    t.string   "time_can_be_spent"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "points_of_attractions", force: true do |t|
    t.integer  "destination_id"
    t.integer  "poa_type_id"
    t.string   "name"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "preferred_start_time"
    t.time     "preferred_end_time"
  end

  create_table "properties", force: true do |t|
    t.integer  "destination_id"
    t.string   "name"
    t.string   "property_type"
    t.string   "official_rating"
    t.string   "customer_rating"
    t.boolean  "restaurant"
    t.boolean  "pool"
    t.boolean  "fun_zone"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string   "type"
    t.string   "description"
    t.string   "time_can_be_spent"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vacation_consultants", force: true do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "lphone"
    t.string   "mphone"
    t.string   "email"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vacation_types", force: true do |t|
    t.string   "vac_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vc_assignments", force: true do |t|
    t.integer  "vacation_consultant_id"
    t.integer  "cust_iti_request_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
