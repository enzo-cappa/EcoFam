class CreateDefaultUserGroup < ActiveRecord::Migration
  class UserGroup < ActiveRecord::Base
    has_many :users
  end

  class User < ActiveRecord::Base
    belongs_to :user_group
  end
  
  def change
    reversible do |dir|
      dir.up {
        user_group = UserGroup.create(name: "Default")
        users = User.all
        users.each do |user|
          user.user_group = user_group
          user.save!
        end
      }
    end
  end
end
