class RenameContactsToCompanies < ActiveRecord::Migration
  def self.up
    rename_table :contacts, :companies
  end

  def self.down
    rename_table :companies, :contacts
  end
end
