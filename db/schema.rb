# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_10_190001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "id_number_storages", force: :cascade do |t|
    t.integer "sequoia_members_order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "master_cpa_double_accounts", force: :cascade do |t|
    t.integer "lid"
    t.string "list"
    t.integer "uid"
    t.string "lname"
    t.date "search_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "master_cpa_matches", force: :cascade do |t|
    t.integer "lid"
    t.string "list"
    t.integer "uid"
    t.string "lname"
    t.date "search_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "master_cpa_no_mails", force: :cascade do |t|
    t.integer "lid"
    t.string "list"
    t.string "lname"
    t.date "search_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "note"
  end

  create_table "master_cpa_no_matches", force: :cascade do |t|
    t.integer "uid"
    t.string "list"
    t.string "lname"
    t.date "search_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "master_cpas", force: :cascade do |t|
    t.integer "lid"
    t.string "list"
    t.string "lic_st"
    t.string "lic"
    t.string "fname"
    t.string "mi"
    t.string "lname"
    t.string "suf"
    t.string "co"
    t.string "add"
    t.string "add2"
    t.string "city"
    t.string "st"
    t.string "zip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "master_ea_double_accounts", force: :cascade do |t|
    t.integer "lid"
    t.string "list"
    t.integer "uid"
    t.string "lname"
    t.date "search_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "master_ea_matches", force: :cascade do |t|
    t.integer "lid"
    t.string "list"
    t.integer "uid"
    t.string "lname"
    t.date "search_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "master_ea_no_mails", force: :cascade do |t|
    t.integer "lid"
    t.string "list"
    t.string "lname"
    t.date "search_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "note"
  end

  create_table "master_ea_no_matches", force: :cascade do |t|
    t.integer "uid"
    t.string "list"
    t.string "lname"
    t.date "search_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "master_eas", force: :cascade do |t|
    t.integer "lid"
    t.string "list"
    t.string "lic"
    t.string "fname"
    t.string "mi"
    t.string "lname"
    t.string "suf"
    t.string "co"
    t.string "add"
    t.string "add2"
    t.string "city"
    t.string "st"
    t.string "zip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sequoia_customers", force: :cascade do |t|
    t.integer "s_id"
    t.integer "order_id"
    t.integer "uid"
    t.string "lic_state"
    t.string "lic_num"
    t.string "exisiting"
    t.string "purchase_s"
    t.date "purchase"
    t.string "price_s"
    t.integer "price"
    t.string "product_1"
    t.string "product_2"
    t.string "designation"
    t.string "email"
    t.string "fname"
    t.string "lname"
    t.string "street_1"
    t.string "street_2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "existing"
  end

  create_table "sequoia_members", force: :cascade do |t|
    t.integer "uid"
    t.string "lname"
    t.date "first_purchase"
    t.date "last_purchase"
    t.boolean "cpa"
    t.integer "cpa_memberships"
    t.boolean "ea"
    t.integer "ea_memberships"
    t.boolean "afsp"
    t.integer "afsp_purchases"
    t.boolean "ethics"
    t.integer "ethics_purchases"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "other"
  end

  create_table "sequoia_product_lists", force: :cascade do |t|
    t.string "product"
    t.string "who"
    t.string "group"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
