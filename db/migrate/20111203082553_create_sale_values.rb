class CreateSaleValues < ActiveRecord::Migration
  def self.up
    create_table :sale_values do |t|
      t.integer :sale_attr_id
      t.integer :sale_id
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :sale_values
  end
end
