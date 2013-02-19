class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :brand_id
      t.integer :measure_unit_id

      t.timestamps
    end
  end
end
