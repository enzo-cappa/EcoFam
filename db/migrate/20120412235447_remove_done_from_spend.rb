class RemoveDoneFromSpend < ActiveRecord::Migration
  def up
    remove_column :spends, :done
  end

  def down
  end
end
