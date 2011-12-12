class DropSaleAttrs < ActiveRecord::Migration
  def up
    drop_table :sale_attrs
  end

  def down
  end
end
