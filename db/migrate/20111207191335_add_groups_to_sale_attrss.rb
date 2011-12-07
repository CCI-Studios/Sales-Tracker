class AddGroupsToSaleAttrss < ActiveRecord::Migration
  def self.up
    add_column :sale_attrs, :collection, :string
    
  end

  def self.down
    remove_column :sale_attrs, :collection
  end
end
