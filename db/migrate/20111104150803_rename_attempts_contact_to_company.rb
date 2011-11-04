class RenameAttemptsContactToCompany < ActiveRecord::Migration
  def self.up
    rename_column :attempts, :contact_id, :company_id
  end

  def self.down
    rename_column :attempts, :company_id, :contact_id
  end
end
