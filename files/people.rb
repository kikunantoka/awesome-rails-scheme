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

ActiveRecord::Schema.define(version: 20171108101539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "abilities", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mongo_id"
    t.string   "name_downcase"
  end

  add_index "abilities", ["name_downcase"], name: "index_abilities_on_name_downcase", using: :btree

  create_table "abilities_users", id: false, force: :cascade do |t|
    t.integer "ability_id", null: false
    t.integer "user_id",    null: false
  end

  add_index "abilities_users", ["ability_id"], name: "index_abilities_users_on_ability_id", using: :btree
  add_index "abilities_users", ["user_id"], name: "index_abilities_users_on_user_id", using: :btree

  create_table "contract_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mongo_id"
  end

  create_table "draft_skills", force: :cascade do |t|
    t.integer  "requester_id"
    t.integer  "reviewer_id"
    t.integer  "skill_category_id"
    t.integer  "skill_id"
    t.string   "name"
    t.string   "description"
    t.string   "rate_type"
    t.string   "draft_type"
    t.string   "draft_status"
    t.string   "requester_explanation"
    t.string   "reviewer_explanation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.hstore   "original_skill_details"
    t.boolean  "marked_for_delete",      default: false
  end

  add_index "draft_skills", ["requester_id"], name: "index_draft_skills_on_requester_id", using: :btree
  add_index "draft_skills", ["reviewer_id"], name: "index_draft_skills_on_reviewer_id", using: :btree
  add_index "draft_skills", ["skill_category_id"], name: "index_draft_skills_on_skill_category_id", using: :btree
  add_index "draft_skills", ["skill_id"], name: "index_draft_skills_on_skill_id", using: :btree

  create_table "features", force: :cascade do |t|
    t.string   "key"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mongo_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mongo_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "role_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "billable"
    t.boolean  "project_archived",  default: false
    t.boolean  "project_potential", default: true
    t.boolean  "project_internal",  default: true
    t.boolean  "stays",             default: false
    t.boolean  "booked",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mongo_id"
    t.datetime "booked_at"
  end

  add_index "memberships", ["project_id"], name: "index_memberships_on_project_id", using: :btree
  add_index "memberships", ["role_id"], name: "index_memberships_on_role_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.text     "text"
    t.boolean  "open",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mongo_id"
  end

  add_index "notes", ["project_id"], name: "index_notes_on_project_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.string   "notification_type"
    t.string   "notification_status"
    t.integer  "receiver_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "notifications", ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable_type_and_notifiable_id", using: :btree
  add_index "notifications", ["receiver_id"], name: "index_notifications_on_receiver_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "starts_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mongo_id"
    t.boolean  "primary",    default: false, null: false
  end

  add_index "positions", ["role_id"], name: "index_positions_on_role_id", using: :btree
  add_index "positions", ["user_id"], name: "index_positions_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "end_at"
    t.boolean  "archived",          default: false
    t.boolean  "potential",         default: false
    t.boolean  "internal",          default: false
    t.datetime "kickoff"
    t.string   "project_type"
    t.string   "color"
    t.string   "initials"
    t.string   "toggl_bookmark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mongo_id"
    t.datetime "starts_at"
    t.datetime "maintenance_since"
    t.boolean  "synchronize",       default: true,  null: false
    t.string   "sf_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.integer  "priority",          default: 1
    t.boolean  "billable",          default: false
    t.boolean  "technical",         default: false
    t.boolean  "show_in_team",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mongo_id"
    t.integer  "element_order",     default: 0,     null: false
    t.integer  "user_ids",          default: [],                 array: true
    t.integer  "skill_category_id"
  end

  add_index "roles", ["skill_category_id"], name: "index_roles_on_skill_category_id", using: :btree

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

  create_table "salesforce_jobs", force: :cascade do |t|
    t.string "operation",     null: false
    t.string "object",        null: false
    t.string "content_type",  null: false
    t.string "salesforce_id", null: false
    t.string "state",         null: false
  end

  add_index "salesforce_jobs", ["salesforce_id"], name: "index_salesforce_jobs_on_salesforce_id", using: :btree

  create_table "skill_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "rate_type"
    t.integer  "skill_category_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "ref_name"
    t.string   "salesforce_id"
    t.boolean  "marked_for_delete", default: false
  end

  add_index "skills", ["salesforce_id"], name: "index_skills_on_salesforce_id", using: :btree
  add_index "skills", ["skill_category_id"], name: "index_skills_on_skill_category_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "initials"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mongo_id"
    t.integer  "user_id"
  end

  add_index "teams", ["user_id"], name: "index_teams_on_user_id", using: :btree

  create_table "teams_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "team_id", null: false
  end

  add_index "teams_users", ["team_id"], name: "index_teams_users_on_team_id", using: :btree
  add_index "teams_users", ["user_id"], name: "index_teams_users_on_user_id", using: :btree

  create_table "user_skill_rate_contents", force: :cascade do |t|
    t.integer  "rate",               default: 0
    t.integer  "user_skill_rate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "note"
    t.boolean  "favorite"
  end

  add_index "user_skill_rate_contents", ["user_skill_rate_id"], name: "index_user_skill_rate_contents_on_user_skill_rate_id", using: :btree

  create_table "user_skill_rates", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "note",          default: ""
    t.boolean  "favorite",      default: false
    t.integer  "rate",          default: 0
    t.string   "salesforce_id"
  end

  add_index "user_skill_rates", ["skill_id"], name: "index_user_skill_rates_on_skill_id", using: :btree
  add_index "user_skill_rates", ["user_id"], name: "index_user_skill_rates_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "encrypted_password"
    t.integer  "sign_in_count",      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "team_join_time"
    t.string   "oauth_token"
    t.string   "refresh_token"
    t.datetime "oauth_expires_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "gh_nick"
    t.string   "skype"
    t.integer  "employment",         default: 0
    t.string   "phone"
    t.boolean  "archived",           default: false
    t.boolean  "without_gh",         default: false
    t.string   "uid"
    t.text     "user_notes"
    t.integer  "primary_role_id"
    t.integer  "contract_type_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mongo_id"
    t.string   "gravatar"
    t.integer  "role_ids",           default: [],    array: true
    t.integer  "role_id"
    t.boolean  "admin",              default: false
    t.integer  "commitment"
    t.string   "api_token"
    t.string   "salesforce_id"
  end

  add_index "users", ["contract_type_id"], name: "index_users_on_contract_type_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["location_id"], name: "index_users_on_location_id", using: :btree
  add_index "users", ["primary_role_id"], name: "index_users_on_primary_role_id", using: :btree

  add_foreign_key "draft_skills", "skill_categories"
  add_foreign_key "draft_skills", "skills"
  add_foreign_key "skills", "skill_categories"
  add_foreign_key "user_skill_rates", "skills"
  add_foreign_key "user_skill_rates", "users"
end
