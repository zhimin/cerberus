class AddSpecificTasksToProjects < ActiveRecord::Migration
  def self.up
        add_column :projects, :build_task, :string
        add_column :projects, :test_ui_task, :string
        add_column :projects, :test_ui_grid_task, :string
  end

  def self.down
        remove_column :projects, :test_ui_grid_task
        remove_column :projects, :test_ui_task
        remove_column :projects, :build_task
  end
end
