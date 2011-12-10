class CreateFormElements < ActiveRecord::Migration
  def self.up
    create_table :form_elements do |t|
      t.integer :form_id
      t.integer :type
      t.integer :x
      t.integer :y
      t.integer :width
      t.integer :height
      t.string :option

      t.timestamps
    end
  end

  def self.down
    drop_table :form_elements
  end
end
