class RemoveForeignKeyAndIndexFromTableName < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :child_table, :parent_table
    remove_index :child_table, :parent_id
    remove_column :child_table, :parent_id
  end
end
