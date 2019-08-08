class RenameDeliveryCommissionColumnInPurchases < ActiveRecord::Migration[5.2]
  def change
    rename_column :purchases, :delivery_commission, :cash_on_delivery
  end
end
