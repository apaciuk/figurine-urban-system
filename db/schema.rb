# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_21_011534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_permissions", id: :serial, force: :cascade do |t|
    t.string "action", limit: 255
    t.string "subject", limit: 255
    t.jsonb "properties"
    t.jsonb "conditions"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["created_by_id"], name: "admin_permissions_created_by_id_fk"
    t.index ["updated_by_id"], name: "admin_permissions_updated_by_id_fk"
  end

  create_table "admin_permissions_role_links", id: false, force: :cascade do |t|
    t.integer "permission_id"
    t.integer "role_id"
    t.index ["permission_id"], name: "admin_permissions_role_links_fk"
    t.index ["role_id"], name: "admin_permissions_role_links_inv_fk"
  end

  create_table "admin_roles", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "code", limit: 255
    t.string "description", limit: 255
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["created_by_id"], name: "admin_roles_created_by_id_fk"
    t.index ["updated_by_id"], name: "admin_roles_updated_by_id_fk"
  end

  create_table "admin_users", id: :serial, force: :cascade do |t|
    t.string "firstname", limit: 255
    t.string "lastname", limit: 255
    t.string "username", limit: 255
    t.string "email", limit: 255
    t.string "password", limit: 255
    t.string "reset_password_token", limit: 255
    t.string "registration_token", limit: 255
    t.boolean "is_active"
    t.boolean "blocked"
    t.string "prefered_language", limit: 255
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["created_by_id"], name: "admin_users_created_by_id_fk"
    t.index ["updated_by_id"], name: "admin_users_updated_by_id_fk"
  end

  create_table "admin_users_roles_links", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "admin_users_roles_links_inv_fk"
    t.index ["user_id"], name: "admin_users_roles_links_fk"
  end

  create_table "announcements", force: :cascade do |t|
    t.datetime "published_at", precision: 6
    t.string "announcement_type"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "files", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "alternative_text", limit: 255
    t.string "caption", limit: 255
    t.integer "width"
    t.integer "height"
    t.jsonb "formats"
    t.string "hash", limit: 255
    t.string "ext", limit: 255
    t.string "mime", limit: 255
    t.decimal "size", precision: 10, scale: 2
    t.string "url", limit: 255
    t.string "preview_url", limit: 255
    t.string "provider", limit: 255
    t.jsonb "provider_metadata"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["created_by_id"], name: "files_created_by_id_fk"
    t.index ["updated_by_id"], name: "files_updated_by_id_fk"
  end

  create_table "files_related_morphs", id: false, force: :cascade do |t|
    t.integer "file_id"
    t.integer "related_id"
    t.string "related_type", limit: 255
    t.string "field", limit: 255
    t.integer "order"
    t.index ["file_id"], name: "files_related_morphs_fk"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at", precision: 6
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "i18n_locale", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "code", limit: 255
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["created_by_id"], name: "i18n_locale_created_by_id_fk"
    t.index ["updated_by_id"], name: "i18n_locale_updated_by_id_fk"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type", null: false
    t.json "params"
    t.datetime "read_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "provider"
    t.string "uid"
    t.string "access_token"
    t.string "access_token_secret"
    t.string "refresh_token"
    t.datetime "expires_at", precision: 6
    t.text "auth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "strapi_api_tokens", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "description", limit: 255
    t.string "type", limit: 255
    t.string "access_key", limit: 255
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["created_by_id"], name: "strapi_api_tokens_created_by_id_fk"
    t.index ["updated_by_id"], name: "strapi_api_tokens_updated_by_id_fk"
  end

  create_table "strapi_core_store_settings", id: :serial, force: :cascade do |t|
    t.string "key", limit: 255
    t.text "value"
    t.string "type", limit: 255
    t.string "environment", limit: 255
    t.string "tag", limit: 255
  end

  create_table "strapi_database_schema", id: :serial, force: :cascade do |t|
    t.json "schema"
    t.datetime "time"
    t.string "hash", limit: 255
  end

  create_table "strapi_migrations", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "time"
  end

  create_table "strapi_webhooks", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.text "url"
    t.jsonb "headers"
    t.jsonb "events"
    t.boolean "enabled"
  end

  create_table "up_permissions", id: :serial, force: :cascade do |t|
    t.string "action", limit: 255
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["created_by_id"], name: "up_permissions_created_by_id_fk"
    t.index ["updated_by_id"], name: "up_permissions_updated_by_id_fk"
  end

  create_table "up_permissions_role_links", id: false, force: :cascade do |t|
    t.integer "permission_id"
    t.integer "role_id"
    t.index ["permission_id"], name: "up_permissions_role_links_fk"
    t.index ["role_id"], name: "up_permissions_role_links_inv_fk"
  end

  create_table "up_roles", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "description", limit: 255
    t.string "type", limit: 255
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["created_by_id"], name: "up_roles_created_by_id_fk"
    t.index ["updated_by_id"], name: "up_roles_updated_by_id_fk"
  end

  create_table "up_users", id: :serial, force: :cascade do |t|
    t.string "username", limit: 255
    t.string "email", limit: 255
    t.string "provider", limit: 255
    t.string "password", limit: 255
    t.string "reset_password_token", limit: 255
    t.string "confirmation_token", limit: 255
    t.boolean "confirmed"
    t.boolean "blocked"
    t.datetime "created_at", precision: 6
    t.datetime "updated_at", precision: 6
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["created_by_id"], name: "up_users_created_by_id_fk"
    t.index ["updated_by_id"], name: "up_users_updated_by_id_fk"
  end

  create_table "up_users_role_links", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "up_users_role_links_inv_fk"
    t.index ["user_id"], name: "up_users_role_links_fk"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: 6
    t.datetime "last_sign_in_at", precision: 6
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: 6
    t.datetime "confirmation_sent_at", precision: 6
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "last_name"
    t.datetime "announcements_last_read_at", precision: 6
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "admin_permissions", "admin_users", column: "created_by_id", name: "admin_permissions_created_by_id_fk", on_delete: :cascade
  add_foreign_key "admin_permissions", "admin_users", column: "updated_by_id", name: "admin_permissions_updated_by_id_fk", on_delete: :cascade
  add_foreign_key "admin_permissions_role_links", "admin_permissions", column: "permission_id", name: "admin_permissions_role_links_fk", on_delete: :cascade
  add_foreign_key "admin_permissions_role_links", "admin_roles", column: "role_id", name: "admin_permissions_role_links_inv_fk", on_delete: :cascade
  add_foreign_key "admin_roles", "admin_users", column: "created_by_id", name: "admin_roles_created_by_id_fk", on_delete: :cascade
  add_foreign_key "admin_roles", "admin_users", column: "updated_by_id", name: "admin_roles_updated_by_id_fk", on_delete: :cascade
  add_foreign_key "admin_users", "admin_users", column: "created_by_id", name: "admin_users_created_by_id_fk", on_delete: :cascade
  add_foreign_key "admin_users", "admin_users", column: "updated_by_id", name: "admin_users_updated_by_id_fk", on_delete: :cascade
  add_foreign_key "admin_users_roles_links", "admin_roles", column: "role_id", name: "admin_users_roles_links_inv_fk", on_delete: :cascade
  add_foreign_key "admin_users_roles_links", "admin_users", column: "user_id", name: "admin_users_roles_links_fk", on_delete: :cascade
  add_foreign_key "files", "admin_users", column: "created_by_id", name: "files_created_by_id_fk", on_delete: :cascade
  add_foreign_key "files", "admin_users", column: "updated_by_id", name: "files_updated_by_id_fk", on_delete: :cascade
  add_foreign_key "files_related_morphs", "files", name: "files_related_morphs_fk", on_delete: :cascade
  add_foreign_key "i18n_locale", "admin_users", column: "created_by_id", name: "i18n_locale_created_by_id_fk", on_delete: :cascade
  add_foreign_key "i18n_locale", "admin_users", column: "updated_by_id", name: "i18n_locale_updated_by_id_fk", on_delete: :cascade
  add_foreign_key "services", "users"
  add_foreign_key "strapi_api_tokens", "admin_users", column: "created_by_id", name: "strapi_api_tokens_created_by_id_fk", on_delete: :cascade
  add_foreign_key "strapi_api_tokens", "admin_users", column: "updated_by_id", name: "strapi_api_tokens_updated_by_id_fk", on_delete: :cascade
  add_foreign_key "up_permissions", "admin_users", column: "created_by_id", name: "up_permissions_created_by_id_fk", on_delete: :cascade
  add_foreign_key "up_permissions", "admin_users", column: "updated_by_id", name: "up_permissions_updated_by_id_fk", on_delete: :cascade
  add_foreign_key "up_permissions_role_links", "up_permissions", column: "permission_id", name: "up_permissions_role_links_fk", on_delete: :cascade
  add_foreign_key "up_permissions_role_links", "up_roles", column: "role_id", name: "up_permissions_role_links_inv_fk", on_delete: :cascade
  add_foreign_key "up_roles", "admin_users", column: "created_by_id", name: "up_roles_created_by_id_fk", on_delete: :cascade
  add_foreign_key "up_roles", "admin_users", column: "updated_by_id", name: "up_roles_updated_by_id_fk", on_delete: :cascade
  add_foreign_key "up_users", "admin_users", column: "created_by_id", name: "up_users_created_by_id_fk", on_delete: :cascade
  add_foreign_key "up_users", "admin_users", column: "updated_by_id", name: "up_users_updated_by_id_fk", on_delete: :cascade
  add_foreign_key "up_users_role_links", "up_roles", column: "role_id", name: "up_users_role_links_inv_fk", on_delete: :cascade
  add_foreign_key "up_users_role_links", "up_users", column: "user_id", name: "up_users_role_links_fk", on_delete: :cascade
end
