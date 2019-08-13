class DropTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :added_items
  end
end
