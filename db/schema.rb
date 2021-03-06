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

ActiveRecord::Schema.define(version: 20151116152030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pictures", force: true do |t|
    t.string   "youtube_url"
    t.string   "provider"
    t.string   "youtube_vid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img_file_name",           limit: nil
    t.string   "img_content_type",        limit: nil
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.string   "category",                limit: nil
    t.integer  "cached_votes_total",                  default: 0
    t.integer  "cached_votes_score",                  default: 0
    t.integer  "cached_votes_up",                     default: 0
    t.integer  "cached_votes_down",                   default: 0
    t.integer  "cached_weighted_score",               default: 0
    t.integer  "cached_weighted_total",               default: 0
    t.float    "cached_weighted_average",             default: 0.0
    t.boolean  "approved"
  end

  add_index "pictures", ["cached_votes_down"], name: "index_pictures_on_cached_votes_down", using: :btree
  add_index "pictures", ["cached_votes_score"], name: "index_pictures_on_cached_votes_score", using: :btree
  add_index "pictures", ["cached_votes_total"], name: "index_pictures_on_cached_votes_total", using: :btree
  add_index "pictures", ["cached_votes_up"], name: "index_pictures_on_cached_votes_up", using: :btree
  add_index "pictures", ["cached_weighted_average"], name: "index_pictures_on_cached_weighted_average", using: :btree
  add_index "pictures", ["cached_weighted_score"], name: "index_pictures_on_cached_weighted_score", using: :btree
  add_index "pictures", ["cached_weighted_total"], name: "index_pictures_on_cached_weighted_total", using: :btree

  create_table "registrations", force: true do |t|
    t.string   "nume"
    t.string   "prenume"
    t.string   "bday"
    t.string   "bmonth"
    t.string   "byear"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pers"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "provider"
    t.string   "image"
    t.boolean  "admin",                  default: false
    t.string   "gender"
    t.string   "link"
    t.string   "location"
    t.string   "locale"
    t.text     "oauth_token"
    t.integer  "oauth_token_expires_at"
    t.string   "phone"
    t.string   "name"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type", limit: nil
    t.integer  "voter_id"
    t.string   "voter_type",   limit: nil
    t.boolean  "vote_flag"
    t.string   "vote_scope",   limit: nil
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
