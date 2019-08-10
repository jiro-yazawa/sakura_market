class RenameItemIdColumnOnCartItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :cart_items, :item_id, :product_id
  end
end
