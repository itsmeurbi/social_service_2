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

ActiveRecord::Schema.define(version: 2019_06_21_071914) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "certificate_parts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "header"
    t.text "body"
    t.string "footer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "certificates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date"
    t.bigint "exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "certificate_parts_id"
    t.index ["certificate_parts_id"], name: "index_certificates_on_certificate_parts_id"
    t.index ["exam_id"], name: "index_certificates_on_exam_id"
  end

  create_table "comprehension_options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.integer "type"
    t.boolean "correct", default: false
    t.bigint "comprehension_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comprehension_question_id"], name: "index_comprehension_options_on_comprehension_question_id"
  end

  create_table "comprehension_questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.integer "value"
    t.text "lecture", limit: 4294967295
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "unit_id"
    t.index ["unit_id"], name: "index_comprehension_questions_on_unit_id"
    t.index ["user_id"], name: "index_comprehension_questions_on_user_id"
  end

  create_table "editorials", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "id_editorial"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_quests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.integer "chosed_answ"
    t.bigint "multiple_question_id"
    t.bigint "exam_id"
    t.index ["exam_id"], name: "index_exam_quests_on_exam_id"
    t.index ["multiple_question_id"], name: "index_exam_quests_on_multiple_question_id"
  end

  create_table "exams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "level_id"
    t.bigint "period_id"
    t.bigint "student_id"
    t.bigint "user_id"
    t.index ["level_id"], name: "index_exams_on_level_id"
    t.index ["period_id"], name: "index_exams_on_period_id"
    t.index ["student_id"], name: "index_exams_on_student_id"
    t.index ["user_id"], name: "index_exams_on_user_id"
  end

  create_table "levels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "number"
    t.bigint "editorial_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["editorial_id"], name: "index_levels_on_editorial_id"
  end

  create_table "multiple_question_options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.integer "type"
    t.boolean "correct", default: false
    t.bigint "multiple_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["multiple_question_id"], name: "index_multiple_question_options_on_multiple_question_id"
  end

  create_table "multiple_questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.integer "value"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "unit_id"
    t.bigint "comprehension_question_id"
    t.index ["comprehension_question_id"], name: "index_multiple_questions_on_comprehension_question_id"
    t.index ["unit_id"], name: "index_multiple_questions_on_unit_id"
    t.index ["user_id"], name: "index_multiple_questions_on_user_id"
  end

  create_table "periods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "starts_at"
    t.date "ends_at"
    t.bigint "editorial_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["editorial_id"], name: "index_periods_on_editorial_id"
  end

  create_table "questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "no_control"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.bigint "level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_units_on_level_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "user_type", default: 0, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "certificates", "certificate_parts", column: "certificate_parts_id"
  add_foreign_key "certificates", "exams"
  add_foreign_key "comprehension_options", "comprehension_questions", on_delete: :cascade
  add_foreign_key "comprehension_questions", "units"
  add_foreign_key "comprehension_questions", "users"
  add_foreign_key "exam_quests", "exams"
  add_foreign_key "exam_quests", "multiple_questions"
  add_foreign_key "exams", "levels"
  add_foreign_key "exams", "periods"
  add_foreign_key "exams", "students"
  add_foreign_key "exams", "users"
  add_foreign_key "levels", "editorials"
  add_foreign_key "multiple_question_options", "multiple_questions", on_delete: :cascade
  add_foreign_key "multiple_questions", "comprehension_questions", on_delete: :cascade
  add_foreign_key "multiple_questions", "units"
  add_foreign_key "multiple_questions", "users"
  add_foreign_key "periods", "editorials"
  add_foreign_key "units", "levels"
end
