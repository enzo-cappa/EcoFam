class AddPeriodIdToSpend < ActiveRecord::Migration
  def change
    add_column :spends, :period_id, :integer
  end
end
