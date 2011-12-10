class CreateForms < ActiveRecord::Migration
  def self.up
    create_table :forms do |t|
      t.string :name
      t.integer :width
      t.integer :height
      t.boolean :read_only
      t.integer :campaign_id

      t.timestamps
    end
  end

  def self.down
    drop_table :forms
  end
end
