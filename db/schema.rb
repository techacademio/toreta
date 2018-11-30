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

ActiveRecord::Schema.define(version: 20181124092642) do

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "recruits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "company_id"
    t.date     "startdate"
    t.date     "enddate"
    t.string   "agent"
    t.integer  "cost"
    t.string   "area"
    t.integer  "application_num"
    t.integer  "interview_num"
    t.integer  "employ_num"
    t.text     "memo",            limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["company_id"], name: "index_recruits_on_company_id", using: :btree
  end

  create_table "store_recruits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "store_id"
    t.integer  "recruit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recruit_id"], name: "index_store_recruits_on_recruit_id", using: :btree
    t.index ["store_id", "recruit_id"], name: "index_store_recruits_on_store_id_and_recruit_id", unique: true, using: :btree
    t.index ["store_id"], name: "index_store_recruits_on_store_id", using: :btree
  end

  create_table "stores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "company_id"
    t.string   "store"
    t.string   "address"
    t.string   "tel_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_stores_on_company_id", using: :btree
  end

  add_foreign_key "recruits", "companies"
  add_foreign_key "store_recruits", "recruits"
  add_foreign_key "store_recruits", "stores"
  add_foreign_key "stores", "companies"
end
