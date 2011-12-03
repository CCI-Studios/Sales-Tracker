class RenameTypeToKind < ActiveRecord::Migration
  def self.up
    rename_column :sale_attrs, :type, :kind
  end

  def self.down
    rename_column :sale_attrs, :kind, :type
  end
end
