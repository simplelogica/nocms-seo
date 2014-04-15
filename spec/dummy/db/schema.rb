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

ActiveRecord::Schema.define(version: 20140415144514) do

  create_table "no_cms_seo_info_translations", force: true do |t|
    t.integer  "no_cms_seo_info_id"
    t.string   "locale"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "no_cms_seo_info_translations", ["no_cms_seo_info_id"], name: "index_no_cms_seo_info_translations_on_no_cms_seo_info_id"

  create_table "no_cms_seo_infos", force: true do |t|
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "no_cms_seo_infos", ["target_id", "target_type"], name: "index_no_cms_seo_infos_on_target_id_and_target_type"

  create_table "pages", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
