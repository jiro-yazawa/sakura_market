class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.integer :price
      t.text :description
      t.boolean :hidden
      t.integer :display_order
    end
  end
end
