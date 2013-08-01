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

ActiveRecord::Schema.define(:version => 20130801172051) do

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "entry_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "comment"
  end

  create_table "entries", :force => true do |t|
    t.string   "namenskuerzel"
    t.string   "kennzahl"
    t.string   "spaltenzahl"
    t.string   "japanische_umschrift"
    t.string   "kanji"
    t.string   "pali"
    t.string   "sanskrit"
    t.string   "chinesisch"
    t.string   "tibetisch"
    t.string   "koreanisch"
    t.string   "weitere_sprachen"
    t.string   "alternative_japanische_lesungen"
    t.string   "schreibvarianten"
    t.string   "deutsche_uebersetzung"
    t.string   "lemma_art"
    t.string   "jahreszahlen"
    t.text     "uebersetzung"
    t.text     "quellen"
    t.text     "literatur"
    t.text     "eigene_ergaenzungen"
    t.text     "quellen_ergaenzungen"
    t.text     "literatur_ergaenzungen"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.integer  "user_id"
    t.string   "page_reference"
    t.boolean  "freigeschaltet",                  :default => false
    t.string   "romaji_order"
  end

# Could not dump table "entries_fts" because of following StandardError
#   Unknown type '' for column 'id'

# Could not dump table "entries_fts_content" because of following StandardError
#   Unknown type '' for column 'c0id'

  create_table "entries_fts_docsize", :primary_key => "docid", :force => true do |t|
    t.binary "size"
  end

  create_table "entries_fts_segdir", :primary_key => "level", :force => true do |t|
    t.integer "idx"
    t.integer "start_block"
    t.integer "leaves_end_block"
    t.integer "end_block"
    t.binary  "root"
  end

  add_index "entries_fts_segdir", ["level", "idx"], :name => "sqlite_autoindex_entries_fts_segdir_1", :unique => true

  create_table "entries_fts_segments", :primary_key => "blockid", :force => true do |t|
    t.binary "block"
  end

  create_table "entries_fts_stat", :force => true do |t|
    t.binary "value"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
