class CreateMarketBrands < ActiveRecord::Migration
  def change
    create_table :market_brands do |t|
      t.string :name

      t.timestamps
    end
  end
end
