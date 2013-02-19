class CreatePurchaseLines < ActiveRecord::Migration
  def change
    create_table :purchase_lines do |t|
      t.integer :product_id
      t.integer :purchase_id
      t.integer :price_id
      t.decimal :quantity

      t.timestamps
    end
  end
end
