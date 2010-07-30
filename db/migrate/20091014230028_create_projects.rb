class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name, :null => false, :unique => true
      t.string :working_dir, :null => false, :unique => true
      t.string :scm_type
      t.string :scm_repository
      t.string :rake_task
      t.string :build_command
      t.boolean :build_requested, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
