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

ActiveRecord::Schema.define(:version => 20130801041108) do

  create_table "ingredients", :force => true do |t|
    t.string "name"
  end

  create_table "ingredients_searches", :force => true do |t|
    t.integer "ingredient_id"
    t.integer "search_id"
  end

  add_index "ingredients_searches", ["ingredient_id"], :name => "index_ingredients_searches_on_ingredient_id"
  add_index "ingredients_searches", ["search_id"], :name => "index_ingredients_searches_on_search_id"

  create_table "quantities", :force => true do |t|
    t.string   "content"
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "quantities", ["ingredient_id"], :name => "index_quantities_on_ingredient_id"
  add_index "quantities", ["recipe_id"], :name => "index_quantities_on_recipe_id"

  create_table "recipe_ingredients", :force => true do |t|
    t.integer  "ingredient_id"
    t.integer  "recipe_id"
    t.string   "ingredient_text"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "recipes", :force => true do |t|
    t.string  "title"
    t.string  "image"
    t.text    "directions"
    t.integer "time"
    t.integer "servings"
    t.string  "url"
    t.float   "rating"
    t.integer "reviewcount"
  end

  create_table "searches", :force => true do |t|
    t.text     "query"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
