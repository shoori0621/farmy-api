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

ActiveRecord::Schema[8.0].define(version: 2025_06_26_140631) do
  create_table "crop_varieties", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_crop_varieties_on_user_id"
  end

  create_table "expense_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "expense_category_id", null: false
    t.decimal "amount_excl_tax", precision: 10
    t.decimal "amount_incl_tax", precision: 10
    t.decimal "tax_rate", precision: 4, scale: 3
    t.string "expense_destination_name"
    t.text "memo"
    t.datetime "expense_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_category_id"], name: "index_expenses_on_expense_category_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "farm_field_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "farm_fields", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "farm_field_category_id", null: false
    t.string "name"
    t.decimal "size", precision: 6, scale: 2
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farm_field_category_id"], name: "index_farm_fields_on_farm_field_category_id"
    t.index ["user_id"], name: "index_farm_fields_on_user_id"
  end

  create_table "grain_dryings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "crop_variety_id", null: false
    t.decimal "dried_weight", precision: 6, scale: 2
    t.datetime "dried_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crop_variety_id"], name: "index_grain_dryings_on_crop_variety_id"
    t.index ["user_id"], name: "index_grain_dryings_on_user_id"
  end

  create_table "harvests", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "crop_variety_id", null: false
    t.decimal "harvested_weight", precision: 6, scale: 2
    t.datetime "harvested_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crop_variety_id"], name: "index_harvests_on_crop_variety_id"
    t.index ["user_id"], name: "index_harvests_on_user_id"
  end

  create_table "income_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incomes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "crop_variety_id", null: false
    t.decimal "amount", precision: 10
    t.bigint "income_category_id", null: false
    t.string "income_source_name"
    t.text "memo"
    t.datetime "income_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crop_variety_id"], name: "index_incomes_on_crop_variety_id"
    t.index ["income_category_id"], name: "index_incomes_on_income_category_id"
    t.index ["user_id"], name: "index_incomes_on_user_id"
  end

  create_table "threshings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "crop_variety_id", null: false
    t.decimal "threshed_weight", precision: 6, scale: 2
    t.datetime "threshed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crop_variety_id"], name: "index_threshings_on_crop_variety_id"
    t.index ["user_id"], name: "index_threshings_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_logs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "farm_field_id", null: false
    t.string "work_name"
    t.text "memo"
    t.datetime "worked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farm_field_id"], name: "index_work_logs_on_farm_field_id"
    t.index ["user_id"], name: "index_work_logs_on_user_id"
  end

  add_foreign_key "crop_varieties", "users"
  add_foreign_key "expenses", "expense_categories"
  add_foreign_key "expenses", "users"
  add_foreign_key "farm_fields", "farm_field_categories"
  add_foreign_key "farm_fields", "users"
  add_foreign_key "grain_dryings", "crop_varieties"
  add_foreign_key "grain_dryings", "users"
  add_foreign_key "harvests", "crop_varieties"
  add_foreign_key "harvests", "users"
  add_foreign_key "incomes", "crop_varieties"
  add_foreign_key "incomes", "income_categories"
  add_foreign_key "incomes", "users"
  add_foreign_key "threshings", "crop_varieties"
  add_foreign_key "threshings", "users"
  add_foreign_key "work_logs", "farm_fields"
  add_foreign_key "work_logs", "users"
end
