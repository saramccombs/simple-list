# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_23_051334) do

  create_table "chores", force: :cascade do |t|
    t.string "chore_desc"
    t.string "chore_priority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "chore_id", null: false
    t.string "groupname"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chore_id"], name: "index_groups_on_chore_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "ideaboards", force: :cascade do |t|
    t.string "ideaboard_name"
    t.string "ideaboard_desc"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_ideaboards_on_user_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "list_name"
    t.string "list_desc"
    t.integer "ideaboard_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["ideaboard_id"], name: "index_lists_on_ideaboard_id"
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "task_desc"
    t.string "task_priority"
    t.integer "list_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_id"], name: "index_tasks_on_list_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "groups", "chores"
  add_foreign_key "groups", "users"
  add_foreign_key "ideaboards", "users"
  add_foreign_key "lists", "ideaboards"
  add_foreign_key "lists", "users"
  add_foreign_key "tasks", "lists"
  add_foreign_key "tasks", "users"
end
