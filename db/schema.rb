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

ActiveRecord::Schema.define(version: 20150227012227) do

  create_table "trend_crawl_sites", force: :cascade do |t|
    t.string   "domain"
    t.string   "domain_id"
    t.string   "status"
    t.boolean  "available?"
    t.boolean  "registered?"
    t.datetime "created_on"
    t.datetime "updated_on"
    t.datetime "expires_on"
    t.text     "registrar"
    t.text     "registrant_contacts"
    t.text     "admin_contacts"
    t.text     "technical_contacts"
    t.text     "nameservers"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
