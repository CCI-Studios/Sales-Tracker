class AddContactToAttempt < ActiveRecord::Migration
  def self.up
    add_column :attempts, :contact_id, :integer
  end

  def self.down
    remove_column :attempts, :contact_id
  end
end
