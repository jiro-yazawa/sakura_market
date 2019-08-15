class ChangeColumnDatatypeDeliveryDateOfOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :delivery_date, :date
  end
end
