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

ActiveRecord::Schema.define(version: 20160218140633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "no_cms_seo_info_translations", force: :cascade do |t|
    t.integer  "no_cms_seo_info_id"
    t.string   "locale"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "no_cms_seo_info_translations", ["no_cms_seo_info_id"], name: "index_no_cms_seo_info_translations_on_no_cms_seo_info_id", using: :btree

  create_table "no_cms_seo_infos", force: :cascade do |t|
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "no_index",             default: false
    t.boolean  "no_follow",            default: false
    t.boolean  "exclude_from_sitemap", default: false
    t.string   "kind"
  end

  add_index "no_cms_seo_infos", ["target_id", "target_type", "kind"], name: "index_no_cms_seo_infos_kind", unique: true, using: :btree
  add_index "no_cms_seo_infos", ["target_type", "target_id"], name: "index_no_cms_seo_infos_on_target_type_and_target_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
