class RenameTypeFieldOnFormElement < ActiveRecord::Migration
  def self.up
    rename_column :form_elements, :type, :kind
  end

  def self.down
    rename_column :form_elements, :kind, :type
  end
end
