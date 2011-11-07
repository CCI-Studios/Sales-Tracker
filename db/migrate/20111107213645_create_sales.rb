class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.integer :total
      t.integer :company_id
      t.integer :campaign_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sales
  end
end
