class AddBrandToPurchaseLines < ActiveRecord::Migration
  def change
    add_column :purchase_lines, :brand_id, :integer
  end
end
