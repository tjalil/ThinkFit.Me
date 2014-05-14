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

ActiveRecord::Schema.define(version: 20140514231155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.string   "name"
    t.decimal  "met",              precision: 3, scale: 1
    t.string   "type_of_activity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_logs", force: true do |t|
    t.integer  "goal_id"
    t.integer  "duration"
    t.string   "intensity"
    t.decimal  "distance",   precision: 5, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.integer  "user_id"
  end

  create_table "goals", force: true do |t|
    t.integer  "user_id"
    t.integer  "activity_id"
    t.integer  "weekly_goal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
  end

  create_table "teams_users", id: false, force: true do |t|
    t.integer "team_id", null: false
    t.integer "user_id", null: false
  end

  add_index "teams_users", ["team_id"], name: "index_teams_users_on_team_id", using: :btree
  add_index "teams_users", ["user_id"], name: "index_teams_users_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",            null: false
    t.string   "crypted_password", null: false
    t.string   "salt",             null: false
    t.string   "name",             null: false
    t.integer  "height",           null: false
    t.integer  "weight",           null: false
    t.string   "gender",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
