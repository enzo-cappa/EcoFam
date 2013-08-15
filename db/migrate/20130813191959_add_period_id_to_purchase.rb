class AddPeriodIdToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :period_id, :integer
  end
end
