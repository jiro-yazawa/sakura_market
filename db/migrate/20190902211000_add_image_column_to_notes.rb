class AddImageColumnToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :image, :string
  end
end
