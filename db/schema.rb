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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120524155417) do

  create_table "bosses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.string   "server"
    t.string   "description"
    t.string   "clazz"
    t.boolean  "main",                :default => true
    t.integer  "item_level"
    t.integer  "equipped_item_level"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "drops", :force => true do |t|
    t.integer  "boss_id"
    t.integer  "item_id"
    t.date     "dropped_on"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.integer  "level"
    t.string   "dropped_by"
    t.string   "slot"
    t.string   "item_type"
    t.integer  "wowhead_id"
    t.integer  "armory_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "loots", :force => true do |t|
    t.integer  "character_id"
    t.integer  "item_id"
    t.boolean  "equipped",     :default => false
    t.boolean  "disenchanted", :default => false
    t.boolean  "main",         :default => true
    t.date     "received_on"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "slots", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
