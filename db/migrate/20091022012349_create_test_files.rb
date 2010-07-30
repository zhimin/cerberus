class CreateTestFiles < ActiveRecord::Migration
  def self.up
    create_table :test_files do |t|
      t.integer "build_id"
      t.string "filename"
      t.string "description"
      t.string "category" # unit, functional
      t.string "status" # building, assigned

      t.string "agent" # agent is currently running the test
      t.string "past_agents"

      t.integer "num_total"
      t.integer "num_errors"
      t.integer "num_failures"
      t.text "stdout"
      t.text "stderr"
      t.float "duration"
      t.string "result"
      t.string "log_file"

      t.text "comments"
      t.datetime "last_modified"
      t.timestamps
    end

    add_index "test_files", ["build_id"], :name => "index_test_files_on_build_id"
   
  end

  def self.down
    drop_table :test_files
  end
end
