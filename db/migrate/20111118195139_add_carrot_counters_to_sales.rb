class AddCarrotCountersToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :off_campus_carrots, :integer, :default => 0, :null => false
    add_column :sales, :restaurant_carrots, :integer, :default => 0, :null => false
    add_column :sales, :service_carrots, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :sales, :service_carrots
    remove_column :sales, :restaurant_carrots
    remove_column :sales, :off_campus_carrots
  end
end
