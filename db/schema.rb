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

ActiveRecord::Schema.define(version: 2019_07_11_182545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "channels", force: :cascade do |t|
    t.integer "guild_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private", default: false
    t.index ["guild_id"], name: "index_channels_on_guild_id"
  end

  create_table "guilds", force: :cascade do |t|
    t.string "name", null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_guilds_on_owner_id"
  end

  create_table "invites", force: :cascade do |t|
    t.integer "guild_id", null: false
    t.string "url", null: false
    t.boolean "expired", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["url"], name: "index_invites_on_url", unique: true
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "guild_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "guild_id"], name: "index_memberships_on_user_id_and_guild_id", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.string "body", null: false
    t.integer "author_id", null: false
    t.integer "channel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_messages_on_author_id"
    t.index ["channel_id"], name: "index_messages_on_channel_id"
  end

  create_table "private_subscriptions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "channel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_private_subscriptions_on_channel_id"
    t.index ["user_id", "channel_id"], name: "index_private_subscriptions_on_user_id_and_channel_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "username", null: false
    t.string "tag", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
    t.index ["username", "tag"], name: "index_users_on_username_and_tag", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "channels", "guilds", on_delete: :cascade
  add_foreign_key "guilds", "users", column: "owner_id", on_delete: :restrict
  add_foreign_key "invites", "guilds", on_delete: :cascade
  add_foreign_key "memberships", "guilds", on_delete: :cascade
  add_foreign_key "memberships", "users", on_delete: :cascade
  add_foreign_key "messages", "channels", on_delete: :cascade
  add_foreign_key "messages", "users", column: "author_id", on_delete: :cascade
  add_foreign_key "private_subscriptions", "channels", on_delete: :cascade
  add_foreign_key "private_subscriptions", "users", on_delete: :cascade
end
