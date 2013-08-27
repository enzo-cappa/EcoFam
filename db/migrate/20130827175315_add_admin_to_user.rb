class AddAdminToUser < ActiveRecord::Migration
  class User < ActiveRecord::Base
  end
  
  def change
    reversible do |dir|
      add_column :users, :admin, :boolean, default: false
      dir.up {
        users = User.all
        users.each do |user|
          user.admin = true
          user.save!
        end
      }
    end
  end
end
