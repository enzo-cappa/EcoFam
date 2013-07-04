class ChangeAmmountColumnNameInSpend < ActiveRecord::Migration
  def up
    rename_column :spends, :ammount, :amount
  end

  def down
    rename_column :spends, :amount, :ammount
  end
end
