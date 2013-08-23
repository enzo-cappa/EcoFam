class SetUserGroupIdAndUserIdOnSpends < ActiveRecord::Migration
  class UserGroup < ActiveRecord::Base    
  end

  class User < ActiveRecord::Base
  end

  class Spend < ActiveRecord::Base
    belongs_to :user_group
    belongs_to :user
  end
  
  def change
    reversible do |dir|
      dir.up {
        user_group = UserGroup.first
        user = User.first
        spends = Spend.all
        spends.each do |spend|
          spend.user_group = user_group
          spend.user = user
          spend.save!
        end
      }
    end
  end
end
