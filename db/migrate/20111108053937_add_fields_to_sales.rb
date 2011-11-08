class AddFieldsToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :user_id, :integer
    
    add_column :sales, :carrot, :integer
    
    add_column :sales, :off_campus, :integer, :default => 0, :null => false
    add_column :sales, :off_campus_value, :integer, :default => 0, :null => false
    add_column :sales, :off_campus_duration, :integer, :default => 0, :null => false
    
    add_column :sales, :off_campus_featured, :integer, :default => 0, :null => false
    add_column :sales, :off_campus_featured_value, :integer, :default => 0, :null => false
    add_column :sales, :off_campus_featured_duration, :integer, :default => 0, :null => false
    
    add_column :sales, :restaurant, :integer, :default => 0, :null => false
    add_column :sales, :restaurant_value, :integer, :default => 0, :null => false
    add_column :sales, :restaurant_duration, :integer, :default => 0, :null => false
    
    add_column :sales, :restaurant_featured, :integer, :default => 0, :null => false
    add_column :sales, :restaurant_featured_value, :integer, :default => 0, :null => false
    add_column :sales, :restaurant_featured_duration, :integer, :default => 0, :null => false
    
    add_column :sales, :services, :integer, :default => 0, :null => false
    add_column :sales, :services_value, :integer, :default => 0, :null => false
    add_column :sales, :services_duration, :integer, :default => 0, :null => false
        
    add_column :sales, :services_featured, :integer, :default => 0, :null => false
    add_column :sales, :services_featured_value, :integer, :default => 0, :null => false
    add_column :sales, :services_featured_duration, :integer, :default => 0, :null => false
    
    add_column :sales, :email_blast, :integer, :default => 0, :null => false
    add_column :sales, :email_blast_value, :integer, :default => 0, :null => false
    
    add_column :sales, :ads, :integer, :default => 0, :null => false
    add_column :sales, :ads_value, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :sales, :carrot
    
    remove_column :sales, :off_campus
    remove_column :sales, :off_campus_value
    remove_column :sales, :off_campus_duration
    
    remove_column :sales, :off_campus_featured
    remove_column :sales, :off_campus_featured_value
    remove_column :sales, :off_campus_featured_duration
    
    remove_column :sales, :restaurant
    remove_column :sales, :restaurant_value
    remove_column :sales, :restaurant_duration
    
    remove_column :sales, :restaurant_featured
    remove_column :sales, :restaurant_featured_value
    remove_column :sales, :restaurant_featured_duration
    
    remove_column :sales, :services
    remove_column :sales, :services_value
    remove_column :sales, :services_duration
        
    remove_column :sales, :services_featured
    remove_column :sales, :services_featured_value
    remove_column :sales, :services_featured_duration
    
    remove_column :sales, :email_blast
    remove_column :sales, :email_blast_value
    
    remove_column :sales, :ads
    remove_column :sales, :ads_value
  end
end
