class AddPriorityToTestFiles < ActiveRecord::Migration
  def self.up
    add_column :test_files, :priority, :integer
  end

  def self.down
    remove_column :test_files, :priority
  end
end
