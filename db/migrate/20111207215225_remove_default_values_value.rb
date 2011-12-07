class RemoveDefaultValuesValue < ActiveRecord::Migration
  def self.up
    change_column :sales, :values, :text, :default => nil
  end

  def self.down
    change_column :sales, :values, :text, :default => {}
  end
end
