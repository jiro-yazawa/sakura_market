class AddProductIdColumnToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_items, :product, foreign_key: true, after: :order_id
  end
end
