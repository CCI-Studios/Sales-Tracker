class AddSuccessToAttempt < ActiveRecord::Migration
  def self.up
    add_column :attempts, :success, :boolean
  end

  def self.down
    remove_column :attempts, :success
  end
end
