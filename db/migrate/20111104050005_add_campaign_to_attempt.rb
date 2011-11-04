class AddCampaignToAttempt < ActiveRecord::Migration
  def self.up
    add_column :attempts, :campaign_id, :integer
  end

  def self.down
    remove_column :attempts, :campaign_id
  end
end
