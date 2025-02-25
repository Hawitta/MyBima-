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

ActiveRecord::Schema[8.0].define(version: 2025_02_20_113412) do
  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "coverdetails", force: :cascade do |t|
    t.integer "cover_id"
    t.string "category"
    t.string "optional"
    t.integer "younger_age"
    t.integer "older_age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "covers", force: :cascade do |t|
    t.integer "company_id"
    t.string "insurance_type"
    t.string "cover_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "category"
  end

  create_table "insurance_companies", force: :cascade do |t|
    t.string "company_name"
    t.string "logo"
    t.string "website"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shalala"
    t.index ["shalala"], name: "index_insurance_companies_on_company_id"
  end

  create_table "mpesa_transactions", force: :cascade do |t|
    t.string "checkout_request_id"
    t.string "merchant_request_id"
    t.string "phone_number"
    t.decimal "amount"
    t.string "response_code"
    t.string "response_description"
    t.string "customer_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_payments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cover_id"
    t.integer "amount_paid"
    t.string "payment_mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "email"
    t.string "id_number"
    t.integer "phone_number"
    t.integer "kra_pin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
