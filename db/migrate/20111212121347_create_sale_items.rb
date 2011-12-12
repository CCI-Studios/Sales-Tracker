class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.integer :sale_id
      t.integer :product_id
      t.float :quantity
      t.datetime :start_date
      t.datetime :end_date
      t.float :price
      t.float :discount

      t.timestamps
    end
  end
end
