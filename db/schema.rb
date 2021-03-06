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

ActiveRecord::Schema.define(version: 20191212114108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.bigint "phone_number"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "image", default: "https://cdn0.wideopenpets.com/wp-content/uploads/2018/01/Im-a-doggo-770x405.jpg"
    t.string "name", default: "Name Unknown"
    t.integer "age", default: 0
    t.string "sex", default: "Sex Unknown"
    t.bigint "shelter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description", default: "No Description"
    t.string "adoption_status", default: "Adoptable"
    t.index ["shelter_id"], name: "index_pets_on_shelter_id"
  end

  create_table "pets_applications", force: :cascade do |t|
    t.bigint "pet_id"
    t.bigint "application_id"
    t.index ["application_id"], name: "index_pets_applications_on_application_id"
    t.index ["pet_id"], name: "index_pets_applications_on_pet_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title", default: "No Title"
    t.integer "rating"
    t.string "content", default: "No Content"
    t.string "picture", default: "No Picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shelter_id"
    t.index ["shelter_id"], name: "index_reviews_on_shelter_id"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pets", "shelters"
  add_foreign_key "pets_applications", "applications"
  add_foreign_key "pets_applications", "pets"
  add_foreign_key "reviews", "shelters"
end
