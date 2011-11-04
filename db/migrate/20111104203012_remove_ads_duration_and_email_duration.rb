class RemoveAdsDurationAndEmailDuration < ActiveRecord::Migration
  def self.up
    remove_column :attempts, :ads_duration
    remove_column :attempts, :email_blast_duration
  end

  def self.down
    add_column :attempts, :email_blast_duration, :integer, :default => 0, :null => false
    add_column :attempts, :ads_duration, :integer, :default => 0, :null => false
  end
end
