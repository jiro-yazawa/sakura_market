class CreateTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :taxes do |t|
      t.decimal :rate
      t.date :active_date_begin
      t.date :active_date_end
    end
  end
end
