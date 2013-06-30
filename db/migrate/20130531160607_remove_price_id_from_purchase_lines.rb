class RemovePriceIdFromPurchaseLines < ActiveRecord::Migration
  def up
    remove_column :purchase_lines, :price_id
  end

  def down
    add_column :purchase_lines, :price_id, :int
  end
end
