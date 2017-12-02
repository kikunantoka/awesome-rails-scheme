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

ActiveRecord::Schema.define(version: 20171031110604) do

  create_table "bookmarks", force: :cascade do |t|
    t.integer  "user_id",       limit: 4,   null: false
    t.string   "document_id",   limit: 255
    t.string   "title",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type",     limit: 255
    t.string   "document_type", limit: 255
  end

  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id", using: :btree

  create_table "checksum_audit_logs", force: :cascade do |t|
    t.string   "file_set_id",     limit: 255
    t.string   "file_id",         limit: 255
    t.string   "version",         limit: 255
    t.integer  "pass",            limit: 4
    t.string   "expected_result", limit: 255
    t.string   "actual_result",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "checksum_audit_logs", ["file_set_id", "file_id"], name: "by_pid_and_dsid", using: :btree

  create_table "content_blocks", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "value",        limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "external_key", limit: 255
  end

  create_table "curation_concerns_operations", force: :cascade do |t|
    t.string   "status",         limit: 255
    t.string   "operation_type", limit: 255
    t.string   "job_class",      limit: 255
    t.string   "job_id",         limit: 255
    t.string   "type",           limit: 255
    t.text     "message",        limit: 65535
    t.integer  "user_id",        limit: 4
    t.integer  "parent_id",      limit: 4
    t.integer  "lft",            limit: 4,                 null: false
    t.integer  "rgt",            limit: 4,                 null: false
    t.integer  "depth",          limit: 4,     default: 0, null: false
    t.integer  "children_count", limit: 4,     default: 0, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "curation_concerns_operations", ["lft"], name: "index_curation_concerns_operations_on_lft", using: :btree
  add_index "curation_concerns_operations", ["parent_id"], name: "index_curation_concerns_operations_on_parent_id", using: :btree
  add_index "curation_concerns_operations", ["rgt"], name: "index_curation_concerns_operations_on_rgt", using: :btree
  add_index "curation_concerns_operations", ["user_id"], name: "index_curation_concerns_operations_on_user_id", using: :btree

  create_table "featured_works", force: :cascade do |t|
    t.integer  "order",      limit: 4,   default: 5
    t.string   "work_id",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "featured_works", ["order"], name: "index_featured_works_on_order", using: :btree
  add_index "featured_works", ["work_id"], name: "index_featured_works_on_work_id", using: :btree

  create_table "file_download_stats", force: :cascade do |t|
    t.datetime "date"
    t.integer  "downloads",  limit: 4
    t.string   "file_id",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    limit: 4
  end

  add_index "file_download_stats", ["file_id"], name: "index_file_download_stats_on_file_id", using: :btree
  add_index "file_download_stats", ["user_id"], name: "index_file_download_stats_on_user_id", using: :btree

  create_table "file_view_stats", force: :cascade do |t|
    t.datetime "date"
    t.integer  "views",      limit: 4
    t.string   "file_id",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    limit: 4
  end

  add_index "file_view_stats", ["file_id"], name: "index_file_view_stats_on_file_id", using: :btree
  add_index "file_view_stats", ["user_id"], name: "index_file_view_stats_on_user_id", using: :btree

  create_table "follows", force: :cascade do |t|
    t.integer  "followable_id",   limit: 4,                   null: false
    t.string   "followable_type", limit: 255,                 null: false
    t.integer  "follower_id",     limit: 4,                   null: false
    t.string   "follower_type",   limit: 255,                 null: false
    t.boolean  "blocked",                     default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id",   limit: 4
    t.string  "unsubscriber_type", limit: 255
    t.integer "conversation_id",   limit: 4
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "mb_opt_outs_on_conversations_id", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    limit: 255, default: ""
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type",                 limit: 255
    t.text     "body",                 limit: 65535
    t.string   "subject",              limit: 255,   default: ""
    t.integer  "sender_id",            limit: 4
    t.string   "sender_type",          limit: 255
    t.integer  "conversation_id",      limit: 4
    t.boolean  "draft",                              default: false
    t.datetime "updated_at",                                         null: false
    t.datetime "created_at",                                         null: false
    t.integer  "notified_object_id",   limit: 4
    t.string   "notified_object_type", limit: 255
    t.string   "notification_code",    limit: 255
    t.string   "attachment",           limit: 255
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id",     limit: 4
    t.string   "receiver_type",   limit: 255
    t.integer  "notification_id", limit: 4,                   null: false
    t.boolean  "is_read",                     default: false
    t.boolean  "trashed",                     default: false
    t.boolean  "deleted",                     default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id", using: :btree

  create_table "migrate_audits", force: :cascade do |t|
    t.string   "f3_pid",     limit: 255
    t.string   "f3_model",   limit: 255
    t.string   "f3_title",   limit: 255
    t.string   "f4_id",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",     limit: 255
  end

  create_table "minter_states", force: :cascade do |t|
    t.string   "namespace",  limit: 255,   default: "default", null: false
    t.string   "template",   limit: 255,                       null: false
    t.text     "counters",   limit: 65535
    t.integer  "seq",        limit: 8,     default: 0
    t.binary   "rand",       limit: 65535
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "minter_states", ["namespace"], name: "index_minter_states_on_namespace", unique: true, using: :btree

  create_table "permission_template_accesses", force: :cascade do |t|
    t.integer  "permission_template_id", limit: 4
    t.string   "agent_type",             limit: 255
    t.string   "agent_id",               limit: 255
    t.string   "access",                 limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permission_template_accesses", ["permission_template_id"], name: "fk_rails_9c1ccdc6d5", using: :btree

  create_table "permission_templates", force: :cascade do |t|
    t.string   "admin_set_id",   limit: 255
    t.string   "visibility",     limit: 255
    t.string   "workflow_name",  limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "release_date"
    t.string   "release_period", limit: 255
  end

  add_index "permission_templates", ["admin_set_id"], name: "index_permission_templates_on_admin_set_id", using: :btree

  create_table "proxy_deposit_requests", force: :cascade do |t|
    t.string   "work_id",           limit: 255,                       null: false
    t.integer  "sending_user_id",   limit: 4,                         null: false
    t.integer  "receiving_user_id", limit: 4,                         null: false
    t.datetime "fulfillment_date"
    t.string   "status",            limit: 255,   default: "pending", null: false
    t.text     "sender_comment",    limit: 65535
    t.text     "receiver_comment",  limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proxy_deposit_requests", ["receiving_user_id"], name: "index_proxy_deposit_requests_on_receiving_user_id", using: :btree
  add_index "proxy_deposit_requests", ["sending_user_id"], name: "index_proxy_deposit_requests_on_sending_user_id", using: :btree

  create_table "proxy_deposit_rights", force: :cascade do |t|
    t.integer  "grantor_id", limit: 4
    t.integer  "grantee_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proxy_deposit_rights", ["grantee_id"], name: "index_proxy_deposit_rights_on_grantee_id", using: :btree
  add_index "proxy_deposit_rights", ["grantor_id"], name: "index_proxy_deposit_rights_on_grantor_id", using: :btree

  create_table "qa_local_authorities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "qa_local_authorities", ["name"], name: "index_qa_local_authorities_on_name", unique: true, using: :btree

  create_table "qa_local_authority_entries", force: :cascade do |t|
    t.integer  "local_authority_id", limit: 4
    t.string   "label",              limit: 255
    t.string   "uri",                limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "lower_label",        limit: 256
  end

  add_index "qa_local_authority_entries", ["local_authority_id"], name: "index_qa_local_authority_entries_on_local_authority_id", using: :btree
  add_index "qa_local_authority_entries", ["lower_label", "local_authority_id"], name: "index_qa_local_authority_entries_on_lower_label_and_authority", using: :btree
  add_index "qa_local_authority_entries", ["uri"], name: "index_qa_local_authority_entries_on_uri", unique: true, using: :btree

  create_table "queued_files", force: :cascade do |t|
    t.string   "work_id",    limit: 255
    t.string   "file_id",    limit: 255
    t.string   "filename",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "searches", force: :cascade do |t|
    t.text     "query_params", limit: 65535
    t.integer  "user_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type",    limit: 255
  end

  add_index "searches", ["user_id"], name: "index_searches_on_user_id", using: :btree

  create_table "single_use_links", force: :cascade do |t|
    t.string   "downloadKey", limit: 255
    t.string   "path",        limit: 255
    t.string   "itemId",      limit: 255
    t.datetime "expires"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sipity_agents", force: :cascade do |t|
    t.string   "proxy_for_id",   limit: 255, null: false
    t.string   "proxy_for_type", limit: 255, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "sipity_agents", ["proxy_for_id", "proxy_for_type"], name: "sipity_agents_proxy_for", unique: true, using: :btree

  create_table "sipity_comments", force: :cascade do |t|
    t.integer  "entity_id",  limit: 4,     null: false
    t.integer  "agent_id",   limit: 4,     null: false
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "sipity_comments", ["agent_id"], name: "index_sipity_comments_on_agent_id", using: :btree
  add_index "sipity_comments", ["created_at"], name: "index_sipity_comments_on_created_at", using: :btree
  add_index "sipity_comments", ["entity_id"], name: "index_sipity_comments_on_entity_id", using: :btree

  create_table "sipity_entities", force: :cascade do |t|
    t.string   "proxy_for_global_id", limit: 255, null: false
    t.integer  "workflow_id",         limit: 4,   null: false
    t.integer  "workflow_state_id",   limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "sipity_entities", ["proxy_for_global_id"], name: "sipity_entities_proxy_for_global_id", unique: true, using: :btree
  add_index "sipity_entities", ["workflow_id"], name: "index_sipity_entities_on_workflow_id", using: :btree
  add_index "sipity_entities", ["workflow_state_id"], name: "index_sipity_entities_on_workflow_state_id", using: :btree

  create_table "sipity_entity_specific_responsibilities", force: :cascade do |t|
    t.integer  "workflow_role_id", limit: 4,   null: false
    t.string   "entity_id",        limit: 255, null: false
    t.integer  "agent_id",         limit: 4,   null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "sipity_entity_specific_responsibilities", ["agent_id"], name: "sipity_entity_specific_responsibilities_agent", using: :btree
  add_index "sipity_entity_specific_responsibilities", ["entity_id"], name: "sipity_entity_specific_responsibilities_entity", using: :btree
  add_index "sipity_entity_specific_responsibilities", ["workflow_role_id", "entity_id", "agent_id"], name: "sipity_entity_specific_responsibilities_aggregate", unique: true, using: :btree
  add_index "sipity_entity_specific_responsibilities", ["workflow_role_id"], name: "sipity_entity_specific_responsibilities_role", using: :btree

  create_table "sipity_notifiable_contexts", force: :cascade do |t|
    t.integer  "scope_for_notification_id",   limit: 4,   null: false
    t.string   "scope_for_notification_type", limit: 255, null: false
    t.string   "reason_for_notification",     limit: 255, null: false
    t.integer  "notification_id",             limit: 4,   null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "sipity_notifiable_contexts", ["notification_id"], name: "sipity_notifiable_contexts_notification_id", using: :btree
  add_index "sipity_notifiable_contexts", ["scope_for_notification_id", "scope_for_notification_type", "reason_for_notification", "notification_id"], name: "sipity_notifiable_contexts_concern_surrogate", unique: true, using: :btree
  add_index "sipity_notifiable_contexts", ["scope_for_notification_id", "scope_for_notification_type", "reason_for_notification"], name: "sipity_notifiable_contexts_concern_context", using: :btree
  add_index "sipity_notifiable_contexts", ["scope_for_notification_id", "scope_for_notification_type"], name: "sipity_notifiable_contexts_concern", using: :btree

  create_table "sipity_notification_recipients", force: :cascade do |t|
    t.integer  "notification_id",    limit: 4,   null: false
    t.integer  "role_id",            limit: 4,   null: false
    t.string   "recipient_strategy", limit: 255, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "sipity_notification_recipients", ["notification_id", "role_id", "recipient_strategy"], name: "sipity_notifications_recipients_surrogate", using: :btree
  add_index "sipity_notification_recipients", ["notification_id"], name: "sipity_notification_recipients_notification", using: :btree
  add_index "sipity_notification_recipients", ["recipient_strategy"], name: "sipity_notification_recipients_recipient_strategy", using: :btree
  add_index "sipity_notification_recipients", ["role_id"], name: "sipity_notification_recipients_role", using: :btree

  create_table "sipity_notifications", force: :cascade do |t|
    t.string   "name",              limit: 255, null: false
    t.string   "notification_type", limit: 255, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "sipity_notifications", ["name"], name: "index_sipity_notifications_on_name", unique: true, using: :btree
  add_index "sipity_notifications", ["notification_type"], name: "index_sipity_notifications_on_notification_type", using: :btree

  create_table "sipity_roles", force: :cascade do |t|
    t.string   "name",        limit: 255,   null: false
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "sipity_roles", ["name"], name: "index_sipity_roles_on_name", unique: true, using: :btree

  create_table "sipity_workflow_actions", force: :cascade do |t|
    t.integer  "workflow_id",                 limit: 4,   null: false
    t.integer  "resulting_workflow_state_id", limit: 4
    t.string   "name",                        limit: 255, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "sipity_workflow_actions", ["resulting_workflow_state_id"], name: "sipity_workflow_actions_resulting_workflow_state", using: :btree
  add_index "sipity_workflow_actions", ["workflow_id", "name"], name: "sipity_workflow_actions_aggregate", unique: true, using: :btree
  add_index "sipity_workflow_actions", ["workflow_id"], name: "sipity_workflow_actions_workflow", using: :btree

  create_table "sipity_workflow_methods", force: :cascade do |t|
    t.string   "service_name",       limit: 255, null: false
    t.integer  "weight",             limit: 4,   null: false
    t.integer  "workflow_action_id", limit: 4,   null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "sipity_workflow_methods", ["workflow_action_id"], name: "index_sipity_workflow_methods_on_workflow_action_id", using: :btree

  create_table "sipity_workflow_responsibilities", force: :cascade do |t|
    t.integer  "agent_id",         limit: 4, null: false
    t.integer  "workflow_role_id", limit: 4, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "sipity_workflow_responsibilities", ["agent_id", "workflow_role_id"], name: "sipity_workflow_responsibilities_aggregate", unique: true, using: :btree

  create_table "sipity_workflow_roles", force: :cascade do |t|
    t.integer  "workflow_id", limit: 4, null: false
    t.integer  "role_id",     limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "sipity_workflow_roles", ["workflow_id", "role_id"], name: "sipity_workflow_roles_aggregate", unique: true, using: :btree

  create_table "sipity_workflow_state_action_permissions", force: :cascade do |t|
    t.integer  "workflow_role_id",         limit: 4, null: false
    t.integer  "workflow_state_action_id", limit: 4, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "sipity_workflow_state_action_permissions", ["workflow_role_id", "workflow_state_action_id"], name: "sipity_workflow_state_action_permissions_aggregate", unique: true, using: :btree

  create_table "sipity_workflow_state_actions", force: :cascade do |t|
    t.integer  "originating_workflow_state_id", limit: 4, null: false
    t.integer  "workflow_action_id",            limit: 4, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "sipity_workflow_state_actions", ["originating_workflow_state_id", "workflow_action_id"], name: "sipity_workflow_state_actions_aggregate", unique: true, using: :btree

  create_table "sipity_workflow_states", force: :cascade do |t|
    t.integer  "workflow_id", limit: 4,   null: false
    t.string   "name",        limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "sipity_workflow_states", ["name"], name: "index_sipity_workflow_states_on_name", using: :btree
  add_index "sipity_workflow_states", ["workflow_id", "name"], name: "sipity_type_state_aggregate", unique: true, using: :btree

  create_table "sipity_workflows", force: :cascade do |t|
    t.string   "name",                limit: 255,   null: false
    t.string   "label",               limit: 255
    t.text     "description",         limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "allows_access_grant"
  end

  add_index "sipity_workflows", ["name"], name: "index_sipity_workflows_on_name", unique: true, using: :btree

  create_table "sufia_features", force: :cascade do |t|
    t.string   "key",        limit: 255,                 null: false
    t.boolean  "enabled",                default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "superusers", force: :cascade do |t|
    t.integer "user_id", limit: 4, null: false
  end

  create_table "tinymce_assets", force: :cascade do |t|
    t.string   "file",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trophies", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "work_id",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploaded_files", force: :cascade do |t|
    t.string   "file",         limit: 255
    t.integer  "user_id",      limit: 4
    t.string   "file_set_uri", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "uploaded_files", ["file_set_uri"], name: "index_uploaded_files_on_file_set_uri", using: :btree
  add_index "uploaded_files", ["user_id"], name: "index_uploaded_files_on_user_id", using: :btree

  create_table "user_stats", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.datetime "date"
    t.integer  "file_views",     limit: 4
    t.integer  "file_downloads", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "work_views",     limit: 4
  end

  add_index "user_stats", ["user_id"], name: "index_user_stats_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: ""
    t.string   "encrypted_password",     limit: 255,   default: ""
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                  limit: 255,   default: "",    null: false
    t.string   "display_name",           limit: 255
    t.string   "address",                limit: 255
    t.string   "admin_area",             limit: 255
    t.string   "department",             limit: 255
    t.string   "title",                  limit: 255
    t.string   "office",                 limit: 255
    t.string   "chat_id",                limit: 255
    t.string   "website",                limit: 255
    t.string   "affiliation",            limit: 255
    t.string   "telephone",              limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.text     "group_list",             limit: 65535
    t.datetime "groups_last_update"
    t.boolean  "ldap_available"
    t.datetime "ldap_last_update"
    t.string   "facebook_handle",        limit: 255
    t.string   "twitter_handle",         limit: 255
    t.string   "googleplus_handle",      limit: 255
    t.string   "linkedin_handle",        limit: 255
    t.string   "orcid",                  limit: 255
    t.boolean  "system_created",                       default: false
    t.boolean  "logged_in",                            default: true
    t.string   "arkivo_token",           limit: 255
    t.string   "arkivo_subscription",    limit: 255
    t.binary   "zotero_token",           limit: 65535
    t.string   "zotero_userid",          limit: 255
    t.boolean  "guest",                                default: false
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "version_committers", force: :cascade do |t|
    t.string   "obj_id",          limit: 255
    t.string   "datastream_id",   limit: 255
    t.string   "version_id",      limit: 255
    t.string   "committer_login", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_view_stats", force: :cascade do |t|
    t.datetime "date"
    t.integer  "work_views", limit: 4
    t.string   "work_id",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
  end

  add_index "work_view_stats", ["user_id"], name: "index_work_view_stats_on_user_id", using: :btree
  add_index "work_view_stats", ["work_id"], name: "index_work_view_stats_on_work_id", using: :btree

  add_foreign_key "curation_concerns_operations", "users"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id_development"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "mailboxer_receipts_on_notification_id_development"
  add_foreign_key "permission_template_accesses", "permission_templates"
  add_foreign_key "qa_local_authority_entries", "qa_local_authorities", column: "local_authority_id"
  add_foreign_key "uploaded_files", "users"
end
