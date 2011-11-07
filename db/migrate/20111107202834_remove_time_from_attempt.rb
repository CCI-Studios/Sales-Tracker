class RemoveTimeFromAttempt < ActiveRecord::Migration
  def self.up
    remove_column :attempts, :time
  end

  def self.down
    add_column :attempts, :time, :datetime
  end
end
