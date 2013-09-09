class AddTypeToPurchaseLine < ActiveRecord::Migration
  class PurchaseLine < ActiveRecord::Base
  end
  
  def change
    add_column :purchase_lines, :type, :string
    reversible do |dir|
      dir.up { PurchaseLine.update_all type: "PurchaseLine" }
    end
  end
end
