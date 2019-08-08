class CreateAddedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :added_items do |t|
      t.references :cart, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
