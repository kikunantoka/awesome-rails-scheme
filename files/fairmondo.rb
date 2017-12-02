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

ActiveRecord::Schema.define(version: 20160504132652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string  "title"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "company_name"
    t.string  "address_line_1"
    t.string  "address_line_2"
    t.string  "zip"
    t.string  "city"
    t.string  "country"
    t.integer "user_id"
    t.boolean "stashed",        default: false
  end

  add_index "addresses", ["user_id"], name: "addresses_user_id_index", using: :btree

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.integer  "user_id",                                limit: 8
    t.string   "condition"
    t.integer  "price_cents",                            limit: 8, default: 100
    t.string   "currency"
    t.boolean  "fair",                                             default: false
    t.string   "fair_kind"
    t.string   "fair_seal"
    t.boolean  "ecologic",                                         default: false
    t.string   "ecologic_seal"
    t.boolean  "small_and_precious",                               default: false
    t.text     "small_and_precious_reason"
    t.boolean  "small_and_precious_handmade",                      default: false
    t.integer  "quantity",                                         default: 1
    t.text     "transport_details"
    t.text     "payment_details"
    t.integer  "friendly_percent",                                 default: 0
    t.integer  "calculated_fair_cents",                  limit: 8, default: 0,     null: false
    t.integer  "calculated_friendly_cents",              limit: 8, default: 0,     null: false
    t.integer  "calculated_fee_cents",                   limit: 8, default: 0,     null: false
    t.string   "condition_extra"
    t.boolean  "small_and_precious_eu_small_enterprise"
    t.string   "ecologic_kind"
    t.text     "upcycling_reason"
    t.string   "slug"
    t.boolean  "transport_pickup"
    t.boolean  "transport_type1"
    t.boolean  "transport_type2"
    t.string   "transport_type1_provider"
    t.string   "transport_type2_provider"
    t.integer  "transport_type1_price_cents",                      default: 0,     null: false
    t.integer  "transport_type2_price_cents",                      default: 0,     null: false
    t.boolean  "payment_bank_transfer"
    t.boolean  "payment_cash"
    t.boolean  "payment_paypal"
    t.boolean  "payment_cash_on_delivery"
    t.boolean  "payment_invoice"
    t.integer  "payment_cash_on_delivery_price_cents",             default: 0,     null: false
    t.integer  "basic_price_cents",                                default: 0
    t.string   "basic_price_amount"
    t.string   "state"
    t.integer  "vat",                                              default: 0
    t.string   "custom_seller_identifier"
    t.string   "gtin"
    t.integer  "transport_type1_number",                           default: 1
    t.integer  "transport_type2_number",                           default: 1
    t.integer  "discount_id"
    t.integer  "friendly_percent_organisation_id",       limit: 8
    t.string   "article_template_name"
    t.string   "transport_time"
    t.integer  "quantity_available"
    t.boolean  "unified_transport"
    t.boolean  "swappable",                                        default: false
    t.boolean  "borrowable",                                       default: false
    t.integer  "comments_count",                                   default: 0
    t.integer  "original_id",                            limit: 8
    t.boolean  "transport_bike_courier",                           default: false
    t.integer  "transport_bike_courier_number",                    default: 1
    t.boolean  "payment_voucher",                                  default: false
  end

  add_index "articles", ["created_at"], name: "index_articles_on_created_at", using: :btree
  add_index "articles", ["custom_seller_identifier", "user_id"], name: "index_articles_on_custom_seller_identifier_and_user_id", using: :btree
  add_index "articles", ["slug"], name: "index_articles_on_slug", unique: true, using: :btree
  add_index "articles", ["state"], name: "index_articles_on_state", using: :btree
  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "articles_categories", force: true do |t|
    t.integer "category_id"
    t.integer "article_id",  limit: 8
  end

  add_index "articles_categories", ["article_id", "category_id"], name: "articles_category_index", using: :btree
  add_index "articles_categories", ["article_id"], name: "index_articles_categories_on_article_id", using: :btree
  add_index "articles_categories", ["category_id"], name: "index_articles_categories_on_category_id", using: :btree

  create_table "business_transactions", force: true do |t|
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "selected_transport"
    t.string   "selected_payment"
    t.string   "state"
    t.text     "message"
    t.integer  "quantity_bought"
    t.integer  "parent_id",                 limit: 8
    t.integer  "article_id",                limit: 8
    t.datetime "sold_at"
    t.boolean  "purchase_emails_sent",                default: false
    t.integer  "discount_id"
    t.integer  "discount_value_cents"
    t.boolean  "billed_for_fair",                     default: false
    t.boolean  "billed_for_fee",                      default: false
    t.boolean  "billed_for_discount",                 default: false
    t.integer  "line_item_group_id",        limit: 8
    t.boolean  "refunded_fair",                       default: false
    t.boolean  "refunded_fee",                        default: false
    t.boolean  "tos_bike_courier_accepted",           default: false
    t.text     "bike_courier_message"
    t.string   "bike_courier_time"
    t.boolean  "courier_emails_sent",                 default: false
    t.datetime "courier_emails_sent_at"
  end

  add_index "business_transactions", ["article_id"], name: "index_business_transactions_on_article_id", using: :btree
  add_index "business_transactions", ["discount_id"], name: "index_business_transactions_on_discount_id", using: :btree
  add_index "business_transactions", ["line_item_group_id"], name: "index_business_transactions_on_line_item_group_id", using: :btree
  add_index "business_transactions", ["parent_id"], name: "index_business_transactions_on_parent_id", using: :btree

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                 limit: 8
    t.boolean  "sold",                              default: false
    t.integer  "line_item_count",                   default: 0
    t.boolean  "purchase_emails_sent",              default: false
    t.datetime "purchase_emails_sent_at"
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "parent_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.integer  "children_count", default: 0
    t.integer  "weight"
    t.integer  "view_columns",   default: 2
    t.string   "slug"
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type", "updated_at"], name: "index_comments_for_popularity_worker", using: :btree
  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "contents", force: true do |t|
    t.string   "key"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contents", ["key"], name: "index_tinycms_contents_on_key", unique: true, using: :btree

  create_table "direct_debit_mandates", force: true do |t|
    t.string   "reference"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.datetime "activated_at"
    t.datetime "last_used_at"
    t.datetime "revoked_at"
  end

  add_index "direct_debit_mandates", ["user_id"], name: "index_direct_debit_mandates_on_user_id", using: :btree

  create_table "discounts", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "percent"
    t.integer  "max_discounted_value_cents"
    t.integer  "num_of_discountable_articles"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exhibits", force: true do |t|
    t.integer  "article_id",         limit: 8
    t.string   "queue"
    t.integer  "related_article_id", limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "exhibition_date"
  end

  add_index "exhibits", ["article_id"], name: "index_exhibits_on_article_id", using: :btree
  add_index "exhibits", ["related_article_id"], name: "index_exhibits_on_related_article_id", using: :btree

  create_table "fair_trust_questionnaires", force: true do |t|
    t.integer "article_id",                         limit: 8
    t.boolean "support",                                      default: false
    t.text    "support_explanation"
    t.boolean "labor_conditions",                             default: false
    t.text    "labor_conditions_explanation"
    t.boolean "awareness_raising",                            default: false
    t.text    "awareness_raising_explanation"
    t.boolean "environment_protection",                       default: false
    t.text    "environment_protection_explanation"
    t.text    "support_checkboxes"
    t.text    "labor_conditions_checkboxes"
    t.text    "environment_protection_checkboxes"
    t.text    "controlling_checkboxes"
    t.text    "awareness_raising_checkboxes"
    t.boolean "controlling",                                  default: false
    t.text    "controlling_explanation"
    t.string  "support_other"
    t.string  "labor_conditions_other"
    t.string  "environment_protection_other"
    t.string  "controlling_other"
    t.string  "awareness_raising_other"
  end

  add_index "fair_trust_questionnaires", ["article_id"], name: "index_fair_trust_questionnaires_on_article_id", using: :btree

  create_table "feedbacks", force: true do |t|
    t.text     "text"
    t.string   "subject"
    t.string   "from"
    t.string   "to"
    t.string   "variety"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id",          limit: 8
    t.integer  "article_id",       limit: 8
    t.string   "feedback_subject"
    t.string   "help_subject"
    t.text     "source_page"
    t.string   "user_agent"
    t.string   "forename"
    t.string   "lastname"
    t.string   "organisation"
    t.string   "phone"
  end

  add_index "feedbacks", ["article_id"], name: "index_feedbacks_on_article_id", using: :btree
  add_index "feedbacks", ["user_id"], name: "index_feedbacks_on_user_id", using: :btree

  create_table "hearts", force: true do |t|
    t.integer  "user_id"
    t.integer  "heartable_id"
    t.string   "heartable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_token"
  end

  add_index "hearts", ["heartable_id", "heartable_type", "updated_at"], name: "index_hearts_for_popularity_worker", using: :btree
  add_index "hearts", ["heartable_id", "heartable_type"], name: "index_hearts_on_heartable_id_and_heartable_type", using: :btree
  add_index "hearts", ["user_id", "heartable_id", "heartable_type"], name: "index_hearts_on_user_id_and_heartable_id_and_heartable_type", unique: true, using: :btree
  add_index "hearts", ["user_id"], name: "index_hearts_on_user_id", using: :btree
  add_index "hearts", ["user_token", "heartable_id", "heartable_type"], name: "index_hearts_on_user_token_and_heartable_id_and_heartable_type", unique: true, using: :btree

  create_table "images", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "imageable_id",       limit: 8
    t.string   "type"
    t.boolean  "is_title"
    t.string   "external_url"
    t.boolean  "image_processing"
  end

  add_index "images", ["imageable_id", "type"], name: "index_images_on_imageable_id_and_type", using: :btree

  create_table "libraries", force: true do |t|
    t.string   "name"
    t.boolean  "public"
    t.integer  "user_id",                limit: 8
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "library_elements_count",           default: 0
    t.string   "exhibition_name"
    t.integer  "hearts_count",                     default: 0
    t.integer  "comments_count",                   default: 0
    t.float    "popularity",                       default: 0.0
    t.boolean  "audited",                          default: false
  end

  add_index "libraries", ["user_id"], name: "index_libraries_on_user_id", using: :btree

  create_table "library_elements", force: true do |t|
    t.integer  "article_id",      limit: 8
    t.integer  "library_id",      limit: 8
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.datetime "exhibition_date"
    t.boolean  "inactive",                  default: false
  end

  add_index "library_elements", ["article_id"], name: "index_library_elements_on_article_id", using: :btree
  add_index "library_elements", ["library_id"], name: "index_library_elements_on_library_id", using: :btree

  create_table "line_item_groups", force: true do |t|
    t.text     "message"
    t.integer  "cart_id",                            limit: 8
    t.integer  "seller_id",                          limit: 8
    t.integer  "buyer_id",                           limit: 8
    t.boolean  "tos_accepted"
    t.boolean  "unified_transport",                            default: false
    t.boolean  "unified_payment",                              default: false
    t.string   "unified_payment_method"
    t.integer  "transport_address_id",               limit: 8
    t.integer  "payment_address_id",                 limit: 8
    t.string   "purchase_id"
    t.datetime "sold_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unified_transport_provider"
    t.integer  "unified_transport_maximum_articles"
    t.integer  "unified_transport_price_cents",      limit: 8, default: 0
    t.integer  "free_transport_at_price_cents",      limit: 8
    t.boolean  "purchase_emails_sent",                         default: false
    t.datetime "purchase_emails_sent_at"
  end

  add_index "line_item_groups", ["buyer_id"], name: "index_line_item_groups_on_buyer_id", using: :btree
  add_index "line_item_groups", ["cart_id"], name: "index_line_item_groups_on_cart_id", using: :btree
  add_index "line_item_groups", ["payment_address_id"], name: "index_line_item_groups_on_payment_address_id", using: :btree
  add_index "line_item_groups", ["purchase_id"], name: "index_line_item_groups_on_purchase_id", using: :btree
  add_index "line_item_groups", ["seller_id"], name: "index_line_item_groups_on_seller_id", using: :btree
  add_index "line_item_groups", ["transport_address_id"], name: "index_line_item_groups_on_transport_address_id", using: :btree

  create_table "line_items", force: true do |t|
    t.integer  "line_item_group_id", limit: 8
    t.integer  "article_id",         limit: 8
    t.integer  "requested_quantity",           default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["article_id"], name: "index_line_items_on_article_id", using: :btree
  add_index "line_items", ["line_item_group_id"], name: "index_line_items_on_line_item_group_id", using: :btree

  create_table "mass_upload_articles", force: true do |t|
    t.integer  "mass_upload_id"
    t.integer  "article_id"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "row_index"
    t.text     "validation_errors"
    t.text     "article_csv"
    t.string   "process_identifier"
  end

  add_index "mass_upload_articles", ["article_id"], name: "index_mass_upload_articles_on_article_id", using: :btree
  add_index "mass_upload_articles", ["mass_upload_id"], name: "index_mass_upload_articles_on_mass_upload_id", using: :btree
  add_index "mass_upload_articles", ["row_index", "mass_upload_id"], name: "index_mass_upload_articles_on_row_index_and_mass_upload_id", using: :btree
  add_index "mass_upload_articles", ["row_index"], name: "index_mass_upload_articles_on_row_index", using: :btree

  create_table "mass_uploads", force: true do |t|
    t.integer  "row_count"
    t.text     "failure_reason"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "state"
  end

  add_index "mass_uploads", ["user_id"], name: "index_mass_uploads_on_user_id", using: :btree

  create_table "notices", force: true do |t|
    t.text     "message"
    t.boolean  "open"
    t.integer  "user_id"
    t.string   "path"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notices", ["user_id"], name: "index_notices_on_user_id", using: :btree

  create_table "payments", force: true do |t|
    t.string   "pay_key"
    t.string   "state"
    t.string   "type"
    t.text     "error"
    t.text     "last_ipn"
    t.integer  "line_item_group_id", limit: 8, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["line_item_group_id"], name: "index_payment_on_line_item_group_id", using: :btree

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "ratings", force: true do |t|
    t.string   "rating"
    t.text     "text"
    t.integer  "rated_user_id",      limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "line_item_group_id", limit: 8
  end

  add_index "ratings", ["line_item_group_id"], name: "index_line_item_group_id_on_ratings", using: :btree
  add_index "ratings", ["rated_user_id"], name: "index_ratings_on_rated_user_id", using: :btree

  create_table "refunds", force: true do |t|
    t.string   "reason"
    t.text     "description"
    t.integer  "business_transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refunds", ["business_transaction_id"], name: "index_refunds_on_business_transaction_id", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "social_producer_questionnaires", force: true do |t|
    t.integer "article_id",                                  limit: 8
    t.boolean "nonprofit_association",                                 default: false
    t.text    "nonprofit_association_checkboxes"
    t.boolean "social_businesses_muhammad_yunus",                      default: false
    t.text    "social_businesses_muhammad_yunus_checkboxes"
    t.boolean "social_entrepreneur",                                   default: false
    t.text    "social_entrepreneur_checkboxes"
    t.text    "social_entrepreneur_explanation"
  end

  add_index "social_producer_questionnaires", ["article_id"], name: "index_social_producer_questionnaires_on_article_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                                        default: "",    null: false
    t.string   "encrypted_password",                           default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",                                default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                                        default: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "banned"
    t.string   "nickname"
    t.text     "about_me"
    t.text     "terms"
    t.text     "cancellation"
    t.text     "about"
    t.string   "phone"
    t.string   "mobile"
    t.string   "fax"
    t.string   "slug"
    t.string   "type"
    t.string   "bank_code"
    t.string   "bank_name"
    t.string   "bank_account_owner"
    t.string   "bank_account_number"
    t.string   "paypal_account"
    t.string   "seller_state"
    t.string   "buyer_state"
    t.boolean  "verified"
    t.boolean  "bankaccount_warning"
    t.float    "percentage_of_positive_ratings",               default: 0.0
    t.float    "percentage_of_negative_ratings",               default: 0.0
    t.boolean  "direct_debit",                                 default: false
    t.float    "percentage_of_neutral_ratings",                default: 0.0
    t.boolean  "ngo",                                          default: false
    t.integer  "value_of_goods_cents",               limit: 8, default: 0
    t.integer  "max_value_of_goods_cents_bonus",     limit: 8, default: 0
    t.integer  "fastbill_subscription_id"
    t.integer  "fastbill_id"
    t.string   "iban"
    t.string   "bic"
    t.boolean  "vacationing",                                  default: false
    t.boolean  "newsletter",                                   default: false
    t.string   "cancellation_form_file_name"
    t.string   "cancellation_form_content_type"
    t.integer  "cancellation_form_file_size"
    t.datetime "cancellation_form_updated_at"
    t.integer  "standard_address_id",                limit: 8
    t.integer  "unified_transport_maximum_articles",           default: 1
    t.string   "unified_transport_provider"
    t.integer  "unified_transport_price_cents",      limit: 8, default: 0
    t.boolean  "free_transport_available"
    t.integer  "free_transport_at_price_cents",      limit: 8, default: 0
    t.boolean  "receive_comments_notification",                default: true
    t.boolean  "heavy_uploader",                               default: false
    t.boolean  "uses_vouchers",                                default: false
    t.integer  "total_purchase_donations_cents",     limit: 8, default: 0
    t.string   "belboon_tracking_token"
    t.datetime "belboon_tracking_token_set_at"
    t.integer  "voluntary_contribution"
    t.string   "invoicing_email",                              default: "",    null: false
    t.string   "order_notifications_email",                    default: "",    null: false
    t.boolean  "direct_debit_exemption",                       default: false
    t.integer  "next_direct_debit_mandate_number",             default: 1
    t.boolean  "marketplace_owner_account",                    default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  add_index "users", ["standard_address_id"], name: "index_users_on_standard_address_id", using: :btree

end
