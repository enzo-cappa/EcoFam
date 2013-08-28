class AddUserGroupIdAndUserIdToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :user_group_id, :integer
    add_column :purchases, :user_id, :integer
  end
end
