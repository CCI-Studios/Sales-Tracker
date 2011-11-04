class AddTitleToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :title, :string
  end

  def self.down
    remove_column :companies, :title
  end
end
