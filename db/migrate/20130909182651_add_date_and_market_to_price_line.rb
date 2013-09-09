class AddDateAndMarketToPriceLine < ActiveRecord::Migration
  def change
    add_column :price_lines, :date, :date
    add_column :price_lines, :market_id, :int
  end
end
