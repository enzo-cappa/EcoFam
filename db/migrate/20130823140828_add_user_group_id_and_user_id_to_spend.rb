class AddUserGroupIdAndUserIdToSpend < ActiveRecord::Migration
  def change
    add_column :spends, :user_group_id, :integer
    add_column :spends, :user_id, :integer
  end
end
