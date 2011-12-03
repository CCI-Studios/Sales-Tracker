class CreateSaleAttrs < ActiveRecord::Migration
  def self.up
    create_table :sale_attrs do |t|
      t.integer :campaign_id
      t.string :title
      t.integer :type
      t.string :default
      t.boolean :required

      t.timestamps
    end
  end

  def self.down
    drop_table :sale_attrs
  end
end
