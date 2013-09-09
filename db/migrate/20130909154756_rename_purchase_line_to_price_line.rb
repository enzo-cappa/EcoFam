class RenamePurchaseLineToPriceLine < ActiveRecord::Migration
  def change
    rename_table :purchase_lines, :price_lines
    add_index :price_lines, :type
  end
end
