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

ActiveRecord::Schema[7.0].define(version: 2024_09_11_123818) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_migrations", primary_key: "version", id: :string, force: :cascade do |t|
  end

  create_table "federal_tax_brackets", force: :cascade do |t|
    t.string "tier"
    t.integer "bottom_range_cents", default: 0, null: false
    t.string "bottom_range_currency", default: "USD", null: false
    t.integer "top_range_cents", default: 0, null: false
    t.string "top_range_currency", default: "USD", null: false
    t.float "rate"
    t.integer "cumulative_cents", default: 0, null: false
    t.string "cumulative_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "federal_tax_table_type_id"
    t.index ["federal_tax_table_type_id"], name: "index_federal_tax_brackets_on_federal_tax_table_type_id"
  end

  create_table "federal_tax_table_types", force: :cascade do |t|
    t.string "filing_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fixed_expenses", force: :cascade do |t|
    t.string "expense_name"
    t.integer "annual_cost_cents", default: 0, null: false
    t.string "annual_cost_currency", default: "USD", null: false
    t.integer "monthly_cost_cents", default: 0, null: false
    t.string "monthly_cost_currency", default: "USD", null: false
    t.integer "bi_weekly_cost_cents", default: 0, null: false
    t.string "bi_weekly_cost_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incomes", force: :cascade do |t|
    t.string "income_type"
    t.integer "rate_cents", default: 0, null: false
    t.string "rate_currency", default: "USD", null: false
    t.integer "hours"
    t.integer "weekly_income_cents", default: 0, null: false
    t.string "weekly_income_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "savings_rates", force: :cascade do |t|
    t.string "name"
    t.float "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "standard_deductions", force: :cascade do |t|
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "federal_tax_brackets", "federal_tax_table_types"
end
