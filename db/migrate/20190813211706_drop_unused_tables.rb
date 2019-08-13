class DropUnusedTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :items
    drop_table :order_items
    drop_table :purchases
  end
end
