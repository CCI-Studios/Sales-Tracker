class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.float :quantity
      t.string :quantity_unit
      t.boolean :show_quantity
      t.date :start_date
      t.boolean :show_start_date
      t.boolean :end_date
      t.float :price
      t.float :discount

      t.timestamps
    end
  end
end
