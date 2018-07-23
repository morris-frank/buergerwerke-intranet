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

ActiveRecord::Schema.define(version: 2018_07_23_094005) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cooperatives", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "street"
    t.string "city"
    t.string "additional_board", default: ""
    t.text "description", default: ""
    t.string "website"
    t.float "latitude"
    t.float "longitude"
    t.string "coopnumber", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "zip"
    t.index ["coopnumber"], name: "index_cooperatives_on_coopnumber", unique: true
    t.index ["email"], name: "index_cooperatives_on_email", unique: true
  end

  create_table "file_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
  end

  create_table "fileclips", force: :cascade do |t|
    t.string "name"
    t.integer "file_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["file_category_id"], name: "index_fileclips_on_file_category_id"
  end

  create_table "fileclips_cooperatives", force: :cascade do |t|
    t.integer "fileclip_id"
    t.integer "cooperative_id"
    t.index ["cooperative_id"], name: "index_fileclips_cooperatives_on_cooperative_id"
    t.index ["fileclip_id"], name: "index_fileclips_cooperatives_on_fileclip_id"
  end

  create_table "fileclips_groups", force: :cascade do |t|
    t.integer "fileclip_id"
    t.integer "group_id"
    t.index ["fileclip_id"], name: "index_fileclips_groups_on_fileclip_id"
    t.index ["group_id"], name: "index_fileclips_groups_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.boolean "visible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_groups_on_name", unique: true
  end

  create_table "groups_users", force: :cascade do |t|
    t.integer "member_id"
    t.integer "group_id"
    t.index ["group_id"], name: "index_groups_users_on_group_id"
    t.index ["member_id"], name: "index_groups_users_on_member_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.integer "plant_type"
    t.float "peak_power"
    t.float "annual_generation", default: 1.0
    t.float "longitude"
    t.float "latitude"
    t.string "street"
    t.string "city"
    t.text "description"
    t.integer "cooperative_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "zip"
    t.index ["cooperative_id"], name: "index_plants_on_cooperative_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.boolean "is_coop_admin", default: false
    t.boolean "is_board_member", default: false
    t.boolean "is_editor", default: false
    t.boolean "can_see_customer_data", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.integer "cooperative_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["cooperative_id"], name: "index_users_on_cooperative_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
