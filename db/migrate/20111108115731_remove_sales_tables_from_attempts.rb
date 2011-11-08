class RemoveSalesTablesFromAttempts < ActiveRecord::Migration
  def self.up
    remove_column :attempts, :carrot
    
    remove_column :attempts, :off_campus
    remove_column :attempts, :off_campus_value
    remove_column :attempts, :off_campus_duration
    
    remove_column :attempts, :off_campus_featured
    remove_column :attempts, :off_campus_featured_value
    remove_column :attempts, :off_campus_featured_duration
    
    remove_column :attempts, :restaurant
    remove_column :attempts, :restaurant_value
    remove_column :attempts, :restaurant_duration
    
    remove_column :attempts, :restaurant_featured
    remove_column :attempts, :restaurant_featured_value
    remove_column :attempts, :restaurant_featured_duration
    
    remove_column :attempts, :services
    remove_column :attempts, :services_value
    remove_column :attempts, :services_duration
        
    remove_column :attempts, :services_featured
    remove_column :attempts, :services_featured_value
    remove_column :attempts, :services_featured_duration
    
    remove_column :attempts, :email_blast
    remove_column :attempts, :email_blast_value
    
    remove_column :attempts, :ads
    remove_column :attempts, :ads_value
  end

  def self.down
    add_column :attempts, :user_id, :integer
    
    add_column :attempts, :carrot, :integer
    
    add_column :attempts, :off_campus, :integer, :default => 0, :null => false
    add_column :attempts, :off_campus_value, :integer, :default => 0, :null => false
    add_column :attempts, :off_campus_duration, :integer, :default => 0, :null => false
    
    add_column :attempts, :off_campus_featured, :integer, :default => 0, :null => false
    add_column :attempts, :off_campus_featured_value, :integer, :default => 0, :null => false
    add_column :attempts, :off_campus_featured_duration, :integer, :default => 0, :null => false
    
    add_column :attempts, :restaurant, :integer, :default => 0, :null => false
    add_column :attempts, :restaurant_value, :integer, :default => 0, :null => false
    add_column :attempts, :restaurant_duration, :integer, :default => 0, :null => false
    
    add_column :attempts, :restaurant_featured, :integer, :default => 0, :null => false
    add_column :attempts, :restaurant_featured_value, :integer, :default => 0, :null => false
    add_column :attempts, :restaurant_featured_duration, :integer, :default => 0, :null => false
    
    add_column :attempts, :services, :integer, :default => 0, :null => false
    add_column :attempts, :services_value, :integer, :default => 0, :null => false
    add_column :attempts, :services_duration, :integer, :default => 0, :null => false
        
    add_column :attempts, :services_featured, :integer, :default => 0, :null => false
    add_column :attempts, :services_featured_value, :integer, :default => 0, :null => false
    add_column :attempts, :services_featured_duration, :integer, :default => 0, :null => false
    
    add_column :attempts, :email_blast, :integer, :default => 0, :null => false
    add_column :attempts, :email_blast_value, :integer, :default => 0, :null => false
    
    add_column :attempts, :ads, :integer, :default => 0, :null => false
    add_column :attempts, :ads_value, :integer, :default => 0, :null => false
  end
end
