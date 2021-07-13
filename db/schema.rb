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

ActiveRecord::Schema.define(version: 2021_07_13_051853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "canned_responses", force: :cascade do |t|
    t.string "company"
    t.string "des"
    t.string "state"
    t.text "questions"
    t.text "answer"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "daily_sales", force: :cascade do |t|
    t.date "day"
    t.string "year"
    t.string "month"
    t.string "day_of_week"
    t.integer "sales"
    t.integer "cpa_full_price"
    t.integer "cpa_renewal_price"
    t.integer "ea_full_price"
    t.integer "ea_renewal_price"
    t.integer "ethics"
    t.integer "afsp"
    t.integer "other"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "daily_sales_empires", force: :cascade do |t|
    t.date "day"
    t.string "year"
    t.string "month"
    t.string "day_of_week"
    t.integer "sales"
    t.integer "orders"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "empire_customers", force: :cascade do |t|
    t.integer "e_id"
    t.integer "uid"
    t.string "lic_state"
    t.string "lic_num"
    t.string "existing"
    t.string "purchase_s"
    t.date "purchase"
    t.string "price_s"
    t.integer "price"
    t.string "product"
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
    t.index ["e_id"], name: "index_empire_customers_on_e_id", unique: true
  end

  create_table "empire_master_ca_lists", force: :cascade do |t|
    t.integer "lid"
    t.string "list"
    t.string "lic"
    t.string "record_type"
    t.string "lic_status"
    t.string "iss_date_s"
    t.date "iss_date"
    t.string "exp_date_s"
    t.date "exp_date"
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
    t.string "email"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "lic_state"
    t.index ["lid"], name: "index_empire_master_ca_lists_on_lid", unique: true
  end

  create_table "empire_master_double_accounts", force: :cascade do |t|
    t.integer "uid"
    t.string "lic_st"
    t.string "list"
    t.string "lname"
    t.date "search_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "empire_master_matches", force: :cascade do |t|
    t.integer "lid"
    t.string "list"
    t.string "lic_st"
    t.integer "uid"
    t.date "search_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "lname"
    t.date "exp"
    t.index ["uid"], name: "index_empire_master_matches_on_uid"
  end

  create_table "empire_master_no_matches", force: :cascade do |t|
    t.integer "uid"
    t.string "list"
    t.string "lic_st"
    t.date "search_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "lname"
  end

  create_table "empire_master_ny_lists", force: :cascade do |t|
    t.integer "lid"
    t.string "list"
    t.string "lic"
    t.string "record_type"
    t.string "lic_status"
    t.string "iss_date_s"
    t.date "iss_date"
    t.string "exp_date_s"
    t.date "exp_date"
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
    t.string "email"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "lic_state"
    t.index ["lid"], name: "index_empire_master_ny_lists_on_lid", unique: true
  end

  create_table "empire_members", force: :cascade do |t|
    t.integer "uid"
    t.string "lname"
    t.date "first_purchase"
    t.date "last_purchase"
    t.string "state"
    t.integer "purchases"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uid"], name: "index_empire_members_on_uid", unique: true
  end

  create_table "id_number_storages", force: :cascade do |t|
    t.integer "sequoia_members_order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "daily_sales_id"
    t.integer "daily_sales_sequoia_customer_order_id"
    t.string "sequoia_customer_s_id"
    t.string "integer"
    t.integer "sequoia_member_exps_order_id"
    t.integer "empire_member_e_id"
    t.integer "empire_auto_match_id"
    t.integer "empire_daily_sales_id"
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
    t.string "exp_s"
    t.date "exp"
    t.string "iss_s"
    t.date "iss"
    t.index ["lid"], name: "index_master_cpas_on_lid", unique: true
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
    t.index ["lid"], name: "index_master_eas_on_lid", unique: true
  end

  create_table "mktg_exports", force: :cascade do |t|
    t.integer "uid"
    t.string "campaign"
    t.string "des"
    t.date "exp"
    t.string "fname"
    t.string "lname"
    t.string "street_1"
    t.string "street_2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "text_1"
    t.string "text_2"
    t.string "text_3"
    t.string "text_4"
    t.string "text_5"
    t.string "text_6"
    t.string "text_7"
    t.string "text_8"
    t.string "text_9"
    t.string "text_10"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
  end

  create_table "mktg_materials", force: :cascade do |t|
    t.string "co"
    t.string "campaign"
    t.string "name"
    t.date "land_date"
    t.string "delivered_to"
    t.integer "quantity"
    t.string "link_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mktg_postcards", force: :cascade do |t|
    t.string "campaign"
    t.string "company"
    t.date "mail_day"
    t.date "range_1_a"
    t.date "range_1_b"
    t.date "range_2_a"
    t.date "range_2_b"
    t.boolean "done"
    t.integer "cpa_sent"
    t.integer "ea_sent"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "segment"
    t.integer "sent"
  end

  create_table "no_mail_not_founds", force: :cascade do |t|
    t.string "company"
    t.string "fname"
    t.string "mi"
    t.string "lname"
    t.string "suf"
    t.string "co"
    t.string "add"
    t.string "add2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "note"
    t.string "des"
    t.string "lic_state"
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
    t.index ["order_id"], name: "index_sequoia_customers_on_order_id", unique: true
  end

  create_table "sequoia_member_exps", force: :cascade do |t|
    t.integer "uid"
    t.string "membership"
    t.date "last_membership"
    t.date "membership_exp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uid"], name: "index_sequoia_member_exps_on_uid", unique: true
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
    t.date "membership_exp"
    t.date "discount_exp"
    t.index ["uid"], name: "index_sequoia_members_on_uid", unique: true
  end

  create_table "sequoia_ncoas", force: :cascade do |t|
    t.integer "uid"
    t.string "ncoa_list"
    t.string "street_1"
    t.string "street_2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.boolean "new"
    t.boolean "bad"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "fname"
    t.string "lname"
  end

  create_table "sequoia_product_lists", force: :cascade do |t|
    t.string "product"
    t.string "who"
    t.string "group"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "full_price"
    t.boolean "renewal_price"
    t.boolean "new"
    t.boolean "reterning"
  end

  create_table "sequoia_states", force: :cascade do |t|
    t.string "state"
    t.string "st"
    t.string "list"
    t.integer "list_quantity"
    t.integer "matched"
    t.decimal "market_share"
    t.string "ce_cycle"
    t.integer "hours_per_cycle"
    t.string "ce_due"
    t.string "exp_date"
    t.string "exp_cycle"
    t.string "self_study"
    t.boolean "has_year_minimum"
    t.integer "year_minimum"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "note"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin"
    t.boolean "super_admin"
    t.boolean "mktg"
  end

end
