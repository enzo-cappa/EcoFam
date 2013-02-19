class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :name
      t.integer :market_brand_id

      t.timestamps
    end
  end
end
