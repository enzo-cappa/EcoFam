class AddTypeToPurchaseLine < ActiveRecord::Migration
  def change
    add_column :purchase_lines, :type, :string
    reversible do |dir|
      dir.up { PurchaseLine.update_all type: "PurchaseLine" }
    end
  end
end
