# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100902063907) do

  create_table "friends", :id => false, :force => true do |t|
    t.integer "user_id",        :null => false
    t.integer "user_id_target", :null => false
  end

  create_table "inboxes", :force => true do |t|
    t.integer  "s_id"
    t.integer  "d_id"
    t.text     "message"
    t.integer  "status",     :limit => 3, :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "mobile"
    t.string   "email"
    t.integer  "limit",      :default => 200
    t.integer  "count",      :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
