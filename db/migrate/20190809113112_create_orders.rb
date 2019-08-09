class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user
      t.string :user_name
      t.text :user_location
      t.integer :total_price
      t.integer :subtotal
      t.integer :tax_fee
      t.integer :cash_on_delivery
      t.integer :delivery_fee
      t.datetime :delivery_date
      t.string :delivery_timezone
    end
  end
end
