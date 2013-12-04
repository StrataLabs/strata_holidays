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

ActiveRecord::Schema.define(version: 20131203064332) do

  create_table "campaigns", force: true do |t|
    t.integer  "vacation_consultant_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "active"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "ancestry"], name: "index_comments_on_commentable_id_and_ancestry", using: :btree

  create_table "consultant_customer_destinations", force: true do |t|
    t.integer  "vacation_consultant_id"
    t.integer  "customer_id"
    t.integer  "cust_iti_header_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cust_iti_detail_versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "cust_iti_detail_versions", ["item_type", "item_id"], name: "index_cust_iti_detail_versions_on_item_type_and_item_id", using: :btree

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

  create_table "cust_iti_header_versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "cust_iti_header_versions", ["item_type", "item_id"], name: "index_cust_iti_header_versions_on_item_type_and_item_id", using: :btree

  create_table "cust_iti_headers", force: true do |t|
    t.string   "cust_iti_name"
    t.string   "iti_type"
    t.integer  "vacation_type_id"
    t.date     "trip_start_date"
    t.date     "trip_end_date"
    t.string   "seasons"
    t.integer  "duration"
    t.integer  "no_of_adults"
    t.integer  "no_of_children"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.integer  "vacation_consultant_id"
    t.integer  "version"
    t.string   "state"
    t.integer  "cust_iti_request_id"
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

  create_table "customer_feedbacks", force: true do |t|
    t.integer  "cust_iti_detail_id"
    t.text     "positive_comments"
    t.text     "negative_comments"
    t.text     "suggestions"
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
    t.integer  "user_id"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

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
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "destinations_vacation_consultants", force: true do |t|
    t.integer  "vacation_consultant_id"
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "destinations_vacation_consultants_join_tables", force: true do |t|
    t.integer  "destination_id"
    t.integer  "vacation_consultant_id"
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

  create_table "poa_detail_versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "poa_detail_versions", ["item_type", "item_id"], name: "index_poa_detail_versions_on_item_type_and_item_id", using: :btree

  create_table "poa_types", force: true do |t|
    t.string   "description"
    t.string   "time_can_be_spent"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
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
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "testimonials", force: true do |t|
    t.integer  "vacation_consultant_id"
    t.text     "content"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trip_images", force: true do |t|
    t.string   "caption"
    t.integer  "cust_iti_header_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "user_responses", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact_no"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "no_of_adults"
    t.integer  "no_of_children"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "destinations"
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
    t.string   "name"
    t.string   "user_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

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
    t.string   "preferred_neighborhood"
    t.string   "preferred_locations"
    t.boolean  "planning"
    t.boolean  "booking"
    t.integer  "user_id"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
  end

  create_table "vacation_types", force: true do |t|
    t.string   "vac_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vc_assignments", force: true do |t|
    t.integer  "vacation_consultant_id"
    t.integer  "cust_iti_request_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vc_promotion_mailers", force: true do |t|
    t.string   "subject"
    t.text     "content"
    t.integer  "vacation_consultant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vc_registrations", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "preferred_neighborhood"
    t.boolean  "planning"
    t.boolean  "booking"
    t.string   "preferred_locations"
    t.string   "lphone"
    t.string   "mphone"
    t.string   "email"
    t.string   "comments"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",                 default: "New"
    t.string   "address_1"
    t.string   "address_2"
    t.integer  "user_id"
  end

  create_table "version_mappers", force: true do |t|
    t.integer  "value"
    t.string   "children"
    t.string   "modeltype"
    t.integer  "model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "wish_list_items", force: true do |t|
    t.integer  "customer_id"
    t.integer  "destination_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
