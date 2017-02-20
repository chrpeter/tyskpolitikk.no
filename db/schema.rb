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

ActiveRecord::Schema.define(version: 20170220212518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "base_articles", force: :cascade do |t|
    t.string   "object_type",  null: false
    t.string   "title",        null: false
    t.string   "header_photo"
    t.text     "ingress"
    t.text     "content"
    t.integer  "owner_id"
    t.boolean  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "base_articles", ["owner_id"], name: "index_base_articles_on_owner_id", using: :btree

  create_table "base_articles_users", force: :cascade do |t|
    t.integer "user_id",         null: false
    t.integer "base_article_id", null: false
  end

  add_index "base_articles_users", ["base_article_id"], name: "index_base_articles_users_on_base_article_id", using: :btree
  add_index "base_articles_users", ["user_id"], name: "index_base_articles_users_on_user_id", using: :btree

  create_table "enumerations", force: :cascade do |t|
    t.string   "type",       null: false
    t.integer  "ordinal",    null: false
    t.string   "i18n_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enumerations", ["i18n_key"], name: "index_enumerations_on_i18n_key", using: :btree
  add_index "enumerations", ["type", "i18n_key"], name: "index_enumerations_on_type_and_i18n_key", unique: true, using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",                                 null: false
    t.string   "avatar"
    t.string   "name",                                    null: false
    t.string   "email",         limit: 50
    t.string   "phone",         limit: 20
    t.string   "twitter"
    t.string   "facebook"
    t.string   "instagram"
    t.string   "snapchat"
    t.string   "location"
    t.string   "locale",                   default: "nb"
    t.text     "description"
    t.date     "date_of_birth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "linkedin"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "roles_users", force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  add_foreign_key "base_articles_users", "base_articles"
  add_foreign_key "base_articles_users", "users"
  add_foreign_key "profiles", "users"
end
