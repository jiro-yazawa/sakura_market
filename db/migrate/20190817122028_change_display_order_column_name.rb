class ChangeDisplayOrderColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :display_order, :position
  end
end
