class RenameDateToSpendDate < ActiveRecord::Migration
  def up
    rename_column :spends, :date, :spend_date
  end

  def down
  rename_column :spends, :spend_date, :date
  end
end
