class AddValueToAttempt < ActiveRecord::Migration
  def self.up
    add_column :attempts, :value, :integer
  end

  def self.down
    remove_column :attempts, :value
  end
end
