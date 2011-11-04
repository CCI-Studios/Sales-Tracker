class AddAdDurationToAttempt < ActiveRecord::Migration
  def self.up
    add_column :attempts, :off_campus_duration, :integer, :default => 0, :null => false
    add_column :attempts, :off_campus_featured_duration, :integer, :default => 0, :null => false
    add_column :attempts, :restaurant_duration, :integer, :default => 0, :null => false
    add_column :attempts, :restaurant_featured_duration, :integer, :default => 0, :null => false
    add_column :attempts, :services_duration, :integer, :default => 0, :null => false
    add_column :attempts, :services_featured_duration, :integer, :default => 0, :null => false
    add_column :attempts, :email_blast_duration, :integer, :default => 0, :null => false
    add_column :attempts, :ads_duration, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :attempts, :off_campus_duration
    remove_column :attempts, :off_campus_featured_duration
    remove_column :attempts, :restaurant_duration
    remove_column :attempts, :restaurant_featured_duration
    remove_column :attempts, :services_duration
    remove_column :attempts, :services_featured_duration
    remove_column :attempts, :email_blast_duration
    remove_column :attempts, :ads_duration
  end
end
