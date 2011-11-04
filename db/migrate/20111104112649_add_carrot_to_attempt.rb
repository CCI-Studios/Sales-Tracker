class AddCarrotToAttempt < ActiveRecord::Migration
  def self.up
    add_column :attempts, :carrot, :integer
  end

  def self.down
    remove_column :attempts, :carrot
  end
end
