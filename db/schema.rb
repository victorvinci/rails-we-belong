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

ActiveRecord::Schema.define(version: 2018_08_14_135116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer "importance_1"
    t.integer "weighting_1"
    t.integer "answer_1"
    t.integer "importance_2"
    t.integer "weighting_2"
    t.integer "answer_2"
    t.integer "importance_3"
    t.integer "weighting_3"
    t.integer "answer_3"
    t.integer "importance_4"
    t.integer "weighting_4"
    t.integer "answer_4"
    t.integer "importance_5"
    t.integer "weighting_5"
    t.integer "answer_5"
    t.boolean "minority"
    t.bigint "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_answers_on_review_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "industry_id"
    t.integer "answer_1_total_score"
    t.integer "answer_1_average_score"
    t.integer "answer_2_total_score"
    t.integer "answer_2_average_score"
    t.integer "answer_3_total_score"
    t.integer "answer_3_average_score"
    t.integer "answer_4_total_score"
    t.integer "answer_4_average_score"
    t.integer "answer_5_total_score"
    t.integer "answer_5_average_score"

    t.string "logo_url"

    t.integer "final_rating"
    t.index ["industry_id"], name: "index_companies_on_industry_id"
  end

  create_table "employee_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "sex"
    t.string "gender_identity"
    t.string "ethnicity"
    t.string "sexual_orientation"
    t.string "age_group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "disability"
    t.index ["user_id"], name: "index_employee_profiles_on_user_id"
  end

  create_table "industries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "representative_profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_representative_profiles_on_company_id"
    t.index ["user_id"], name: "index_representative_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.text "pros"
    t.string "user_position"
    t.string "user_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weighting"
    t.text "cons"
    t.text "content"
    t.index ["company_id"], name: "index_reviews_on_company_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "vote_type"
    t.index ["review_id"], name: "index_votes_on_review_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "answers", "reviews"
  add_foreign_key "companies", "industries"
  add_foreign_key "employee_profiles", "users"
  add_foreign_key "representative_profiles", "companies"
  add_foreign_key "representative_profiles", "users"
  add_foreign_key "reviews", "companies"
  add_foreign_key "reviews", "users"
  add_foreign_key "votes", "reviews"
  add_foreign_key "votes", "users"
end
