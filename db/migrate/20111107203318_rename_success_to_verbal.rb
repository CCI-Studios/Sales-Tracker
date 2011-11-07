class RenameSuccessToVerbal < ActiveRecord::Migration
  def self.up
    rename_column :attempts, :success, :verbal
  end

  def self.down
    rename_column :attempts, :verbal, :success
  end
end
