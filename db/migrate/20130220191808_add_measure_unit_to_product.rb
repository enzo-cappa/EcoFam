class AddMeasureUnitToProduct < ActiveRecord::Migration
  def change
    add_column :products, :measure_unit_id, :integer
  end
end
