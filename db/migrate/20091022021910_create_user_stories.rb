class CreateUserStories < ActiveRecord::Migration
  def self.up
    create_table :user_stories do |t|
      t.integer "test_file_id", :null => false
      t.string "name", :null => false
      t.float "duration"
      t.text "failure",      :limit => 255
      t.text "error",        :limit => 255
      t.text "output"
      t.timestamps
    end

    add_index "user_stories", ["test_file_id"], :name => "index_stories_on_test_file_id"    
  end

  def self.down
    drop_table :user_stories
  end
end
