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

ActiveRecord::Schema.define(version: 20150706193436) do

  create_table "book_readers", force: true do |t|
    t.integer  "book_id"
    t.integer  "reader_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "book_readers", ["book_id"], name: "index_book_readers_on_book_id"
  add_index "book_readers", ["reader_id"], name: "index_book_readers_on_reader_id"

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "description"
    t.string   "amazon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating"
    t.date     "finished_on"
    t.text     "keywords"
    t.integer  "genre_id"
  end

  add_index "books", ["genre_id"], name: "index_books_on_genre_id"

  create_table "genres", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "readers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
