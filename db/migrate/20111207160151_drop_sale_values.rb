class DropSaleValues < ActiveRecord::Migration
  def self.up
    drop_table :sale_values
  end

  def self.down
  end
end
