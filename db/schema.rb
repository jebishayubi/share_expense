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

ActiveRecord::Schema[7.0].define(version: 2023_03_16_021157) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecomments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "expense_id"
    t.string "comment"
    t.string "commenter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_ecomments_on_expense_id"
  end

  create_table "empcomments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employcomments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "expense_id"
    t.string "comment"
    t.string "commenter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.string "emp_status"
    t.string "department"
    t.string "email"
    t.string "address"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "employ_id"
    t.string "description"
    t.integer "amount"
    t.integer "invoice_number"
    t.string "expense_type"
    t.string "document"
    t.date "date"
    t.string "comment"
    t.string "reply"
    t.integer "approvalstatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employ_id"], name: "index_expenses_on_employ_id"
  end

  create_table "processingfees", force: :cascade do |t|
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ecomments", "expenses"
  add_foreign_key "expenses", "employs"
end
