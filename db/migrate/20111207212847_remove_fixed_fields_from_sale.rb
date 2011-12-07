class RemoveFixedFieldsFromSale < ActiveRecord::Migration
  def self.up
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
    remove_column :sales, :off_campus_carrots       
    remove_column :sales, :restaurant_carrots       
    remove_column :sales, :service_carrots
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
