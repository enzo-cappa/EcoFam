class AddUserGroupIdAndUserIdToPriceLine < ActiveRecord::Migration
  def change
    add_column :price_lines, :user_group_id, :integer
    add_column :price_lines, :user_id, :integer
  end
end
