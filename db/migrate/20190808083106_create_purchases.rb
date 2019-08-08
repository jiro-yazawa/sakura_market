class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :user
      t.string :user_name, null: false
      t.text :user_location
      t.integer :total_fee, default: 0
      t.integer :subtotal, default: 0
      t.integer :tax_fee, default: 0
      t.datetime :created_at, default: :now
      t.integer :delivery_commission, default: 0
      t.integer :delivery_fee, default: 0
      t.datetime :delivery_date
      t.string :delivery_timezone
    end
  end
end
