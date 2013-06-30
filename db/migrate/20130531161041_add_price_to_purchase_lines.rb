class AddPriceToPurchaseLines < ActiveRecord::Migration
  def change
    add_column :purchase_lines, :price, :decimal, :precision => 10, :scale => 2, :default => 0
  end
end
