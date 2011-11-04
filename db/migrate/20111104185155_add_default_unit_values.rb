class AddDefaultUnitValues < ActiveRecord::Migration
  def self.up
    change_table :attempts do |t|
      t.change :off_campus, :integer, :default => 0, :null => false
      t.change :off_campus_featured, :integer, :default => 0, :null => false
      t.change :restaurant, :integer, :default => 0, :null => false
      t.change :restaurant_featured, :integer, :default => 0, :null => false
      t.change :services, :integer, :default => 0, :null => false
      t.change :services_featured, :integer, :default => 0, :null => false
      t.change :email_blast, :integer, :default => 0, :null => false
      t.change :ads, :integer, :default => 0, :null => false
      t.change :off_campus_value, :integer, :default => 0, :null => false
      t.change :off_campus_featured_value, :integer, :default => 0, :null => false
      t.change :restaurant_value, :integer, :default => 0, :null => false
      t.change :restaurant_featured_value, :integer, :default => 0, :null => false
      t.change :services_value, :integer, :default => 0, :null => false
      t.change :services_featured_value, :integer, :default => 0, :null => false
      t.change :email_blast_value, :integer, :default => 0, :null => false
      t.change :ads_value, :integer, :default => 0, :null => false
    end
  end

  def self.down
  end
end
