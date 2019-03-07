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

ActiveRecord::Schema.define(version: 2019_03_07_042739) do

  create_table "comprehension_options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.integer "type"
    t.bigint "comprehension_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comprehension_question_id"], name: "index_comprehension_options_on_comprehension_question_id"
  end

  create_table "comprehension_questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.integer "value"
    t.bigint "lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "correct_answ_id"
    t.index ["correct_answ_id"], name: "index_comprehension_questions_on_correct_answ_id"
    t.index ["lecture_id"], name: "index_comprehension_questions_on_lecture_id"
  end

  create_table "lectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.string "instructions"
    t.integer "value"
    t.bigint "questions_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questions_id"], name: "index_lectures_on_questions_id"
  end

  create_table "multiple_question_options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.integer "type"
    t.bigint "multiple_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["multiple_question_id"], name: "index_multiple_question_options_on_multiple_question_id"
  end

  create_table "multiple_questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "content"
    t.integer "value"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "correct_answ_id"
    t.index ["correct_answ_id"], name: "index_multiple_questions_on_correct_answ_id"
    t.index ["question_id"], name: "index_multiple_questions_on_question_id"
  end

  create_table "questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id"
    t.index ["author_id"], name: "index_questions_on_author_id"
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

  add_foreign_key "comprehension_options", "comprehension_questions"
  add_foreign_key "comprehension_questions", "comprehension_options", column: "correct_answ_id"
  add_foreign_key "comprehension_questions", "lectures"
  add_foreign_key "lectures", "questions", column: "questions_id"
  add_foreign_key "multiple_question_options", "multiple_questions"
  add_foreign_key "multiple_questions", "multiple_question_options", column: "correct_answ_id"
  add_foreign_key "multiple_questions", "questions"
  add_foreign_key "questions", "users", column: "author_id"
end
