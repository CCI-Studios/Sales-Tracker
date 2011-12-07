class AddValuesToSales < ActiveRecord::Migration
  def self.up
    add_column :sales, :values, :text
  end

  def self.down
    remove_column :sales, :values
  end
end
