class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :quantity_label
      t.boolean :show_quantity, :default => true
      t.string :start_date_label
      t.boolean :show_start_date, :default => true
      t.string :end_date_label
      t.boolean :show_end_date, :default => true
      t.boolean :show_price, :default => true
      t.boolean :show_discount, :default => true
      t.integer :campaign_id
      t.timestamps
    end
  end
end
