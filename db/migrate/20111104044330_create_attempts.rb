class CreateAttempts < ActiveRecord::Migration
  def self.up
    create_table :attempts do |t|
      t.timestamp :time
      t.integer :user_id
      t.boolean :email
      t.boolean :phone
      t.boolean :fax

      t.timestamps
    end
  end

  def self.down
    drop_table :attempts
  end
end
