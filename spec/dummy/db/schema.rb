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

ActiveRecord::Schema.define(version: 20151124233104) do

  create_table "addresses", force: :cascade do |t|
    t.string   "label"
    t.string   "street"
    t.string   "street2"
    t.string   "street3"
    t.string   "number"
    t.string   "care_of"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "lat"
    t.float    "lon"
    t.string   "has_address_type"
    t.integer  "has_address_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "farm_cats", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "main_image"
    t.integer  "farm_cat_id"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
