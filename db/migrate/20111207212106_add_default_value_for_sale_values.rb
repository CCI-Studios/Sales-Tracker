class AddDefaultValueForSaleValues < ActiveRecord::Migration
  def self.up
    change_column :sales, :values, :text, :default => {}
  end

  def self.down
  end
end
