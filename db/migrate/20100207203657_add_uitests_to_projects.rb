class AddUitestsToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :ui_tests, :boolean, :default => false
    add_column :projects, :grid_ui_tests, :boolean, :default => false
  end

  def self.down
    remove_column :projects, :grid_ui_tests
    remove_column :projects, :ui_tests
  end
end
