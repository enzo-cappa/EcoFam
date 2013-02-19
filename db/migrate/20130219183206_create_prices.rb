class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.decimal :ammount
      t.boolean :special
      t.integer :market_id

      t.timestamps
    end
  end
end
