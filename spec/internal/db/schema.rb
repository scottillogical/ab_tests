ActiveRecord::Schema.define do

  create_table "variations", :force => true do |t|
    t.string   "test_name"
    t.string   "chosen_variation"
    t.integer  "unique_identifier"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end
end
