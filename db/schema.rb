# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141221160109) do

  create_table "cards", force: true do |t|
    t.integer  "user_id"
    t.integer  "original_id"
    t.integer  "translation_id"
    t.integer  "distractor1_id"
    t.integer  "distractor2_id"
    t.integer  "chosen_id"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meanings", force: true do |t|
    t.string   "denotation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "full_name"
    t.string   "password_digest"
    t.integer  "from_language_id"
    t.integer  "to_language_id"
    t.boolean  "admin"
    t.boolean  "locked",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "words", force: true do |t|
    t.string   "spelling"
    t.integer  "meaning_id"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
