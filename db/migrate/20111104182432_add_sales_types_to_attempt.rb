class AddSalesTypesToAttempt < ActiveRecord::Migration
  def self.up
    add_column :attempts, :off_campus, :integer
    add_column :attempts, :off_campus_featured, :integer
    add_column :attempts, :restaurant, :integer
    add_column :attempts, :restaurant_featured, :integer
    add_column :attempts, :services, :integer
    add_column :attempts, :services_featured, :integer
    add_column :attempts, :email_blast, :integer
    add_column :attempts, :ads, :integer
    add_column :attempts, :off_campus_value, :integer
    add_column :attempts, :off_campus_featured_value, :integer
    add_column :attempts, :restaurant_value, :integer
    add_column :attempts, :restaurant_featured_value, :integer
    add_column :attempts, :services_value, :integer
    add_column :attempts, :services_featured_value, :integer
    add_column :attempts, :email_blast_value, :integer
    add_column :attempts, :ads_value, :integer
  end

  def self.down
    remove_column :attempts, :off_campus
    remove_column :attempts, :off_campus_featured
    remove_column :attempts, :restaurant
    remove_column :attempts, :restaurant_featured
    remove_column :attempts, :services
    remove_column :attempts, :services_featured
    remove_column :attempts, :email_blast
    remove_column :attempts, :ads
    remove_column :attempts, :off_campus_value
    remove_column :attempts, :off_campus_featured_value
    remove_column :attempts, :restaurant_value
    remove_column :attempts, :restaurant_featured_value
    remove_column :attempts, :services_value
    remove_column :attempts, :services_featured_value
    remove_column :attempts, :email_blast_value
    remove_column :attempts, :ads_value
  end
end
