class CreateCashOnDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :cash_on_deliveries do |t|
      t.integer :fee
      t.integer :orders_total_price_begin
      t.integer :orders_total_price_end
    end
  end
end
