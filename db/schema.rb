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

ActiveRecord::Schema.define(version: 2018_09_19_220525) do

  create_table "advisor_has_subjects", force: :cascade do |t|
    t.integer "advisor_id", null: false
    t.integer "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advisor_id"], name: "index_advisor_has_subjects_on_advisor_id"
    t.index ["subject_id"], name: "index_advisor_has_subjects_on_subject_id"
  end

  create_table "advisors", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "term_id", null: false
    t.boolean "is_valid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_advisors_on_student_id"
    t.index ["term_id"], name: "index_advisors_on_term_id"
  end

  create_table "day_has_hours", force: :cascade do |t|
    t.integer "day_id", null: false
    t.integer "hour_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_day_has_hours_on_day_id"
    t.index ["hour_id"], name: "index_day_has_hours_on_hour_id"
  end

  create_table "days", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_days_on_name", unique: true
  end

  create_table "hours", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_hours_on_name", unique: true
  end

  create_table "people", force: :cascade do |t|
    t.boolean "gay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personas", force: :cascade do |t|
    t.boolean "student"
    t.boolean "worker"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "session_has_students", force: :cascade do |t|
    t.integer "session_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_session_has_students_on_session_id"
    t.index ["student_id"], name: "index_session_has_students_on_student_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "term_id", null: false
    t.integer "advisor_id", null: false
    t.integer "day_has_hour_id", null: false
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advisor_id"], name: "index_sessions_on_advisor_id"
    t.index ["day_has_hour_id"], name: "index_sessions_on_day_has_hour_id"
    t.index ["subject_id"], name: "index_sessions_on_subject_id"
    t.index ["term_id"], name: "index_sessions_on_term_id"
  end

  create_table "student_has_undergraduates", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "undergraduate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_has_undergraduates_on_student_id"
    t.index ["undergraduate_id"], name: "index_student_has_undergraduates_on_undergraduate_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "first_surname", null: false
    t.string "second_surname"
    t.string "university_code", null: false
    t.string "university_username", null: false
    t.string "mobile_phone", null: false
    t.boolean "is_advisor", default: false, null: false
    t.boolean "is_valid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["university_code"], name: "index_students_on_university_code", unique: true
    t.index ["university_username"], name: "index_students_on_university_username", unique: true
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_subjects_on_name", unique: true
  end

  create_table "terms", force: :cascade do |t|
    t.string "name", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_terms_on_name", unique: true
  end

  create_table "undergraduates", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_undergraduates_on_name", unique: true
  end

end
