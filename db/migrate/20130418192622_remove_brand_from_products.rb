class RemoveBrandFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :brand_id
  end

  def down
    add_column :products, :brand_id, :string
  end
end
