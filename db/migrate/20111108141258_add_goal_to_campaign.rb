class AddGoalToCampaign < ActiveRecord::Migration
  def self.up
    add_column :campaigns, :goal, :integer
  end

  def self.down
    remove_column :campaigns, :goal
  end
end
