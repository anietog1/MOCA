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

ActiveRecord::Schema.define(version: 2018_10_18_144220) do

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
    t.boolean "is_valid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "semester_id"
    t.index ["semester_id"], name: "index_advisors_on_semester_id"
    t.index ["student_id"], name: "index_advisors_on_student_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "meeting_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_attendances_on_meeting_id"
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_classrooms_on_name", unique: true
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

  create_table "environments", force: :cascade do |t|
    t.boolean "is_students_register_active", default: false, null: false
    t.boolean "is_advisors_register_active", default: false, null: false
    t.boolean "is_schedules_register_active", default: false, null: false
    t.integer "semester_id", null: false
    t.integer "month_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["month_id"], name: "index_environments_on_month_id"
    t.index ["semester_id"], name: "index_environments_on_semester_id"
  end

  create_table "hours", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_hours_on_name", unique: true
  end

  create_table "meetings", force: :cascade do |t|
    t.integer "session_id", null: false
    t.date "date", null: false
    t.integer "classroom_id"
    t.boolean "is_canceled", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_meetings_on_classroom_id"
    t.index ["session_id"], name: "index_meetings_on_session_id"
  end

  create_table "months", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_months_on_name", unique: true
  end

  create_table "semesters", force: :cascade do |t|
    t.string "name", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_semesters_on_name", unique: true
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
    t.integer "advisor_id", null: false
    t.integer "day_has_hour_id", null: false
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "month_id", null: false
    t.index ["advisor_id"], name: "index_sessions_on_advisor_id"
    t.index ["day_has_hour_id"], name: "index_sessions_on_day_has_hour_id"
    t.index ["month_id"], name: "index_sessions_on_month_id"
    t.index ["subject_id"], name: "index_sessions_on_subject_id"
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
    t.float "advisor_grade"
    t.index ["university_code"], name: "index_students_on_university_code", unique: true
    t.index ["university_username"], name: "index_students_on_university_username", unique: true
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_subjects_on_name", unique: true
  end

  create_table "surveys", force: :cascade do |t|
    t.integer "session_has_student_id", null: false
    t.integer "satisfaction", null: false
    t.integer "contribution", null: false
    t.integer "conditions", null: false
    t.integer "domain", null: false
    t.integer "clarity", null: false
    t.integer "ability", null: false
    t.integer "treat", null: false
    t.integer "method", null: false
    t.text "fears", null: false
    t.text "impact", null: false
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_has_student_id"], name: "index_surveys_on_session_has_student_id"
  end

  create_table "undergraduates", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_undergraduates_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.integer "student_id"
    t.integer "kind", default: 2, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["student_id"], name: "index_users_on_student_id"
  end

end
