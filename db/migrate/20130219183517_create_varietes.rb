class CreateVarietes < ActiveRecord::Migration
  def change
    create_table :varietes do |t|
      t.string :name
      t.integer :product_id

      t.timestamps
    end
  end
end
