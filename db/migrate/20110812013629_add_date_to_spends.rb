class AddDateToSpends < ActiveRecord::Migration
  def self.up
    add_column :spends, :date, :date
  end

  def self.down
    remove_column :spends, :date
  end
end
