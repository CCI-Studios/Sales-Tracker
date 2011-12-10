class AddDefaultToForm < ActiveRecord::Migration
  def self.up
    add_column :forms, :default, :boolean, :default => false
  end

  def self.down
    remove_column :forms, :default
  end
end
