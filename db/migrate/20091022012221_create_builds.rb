class CreateBuilds < ActiveRecord::Migration
  def self.up
    create_table :builds do |t|
      t.integer "project_id"
      t.string "label", :null => false
      t.integer "build_number"
      # t.string "status"
      t.datetime "start_time"
      t.datetime "finish_time"
      t.integer "num_total"
      t.integer "num_errors"
      t.integer "num_failures"
      t.boolean "successful",   :default => false
      t.boolean "distributed",  :default => false
      t.timestamps

    end
    add_index "builds", ["project_id"], :name => "index_builds_on_project_id"

  end

  def self.down
  end
end
