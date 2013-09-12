class SetUserGroupIdAndUserIdOnPriceLine < ActiveRecord::Migration
  class PriceLine < ActiveRecord::Base
    belongs_to :user_group
    belongs_to :user
  end
  
  def change
    reversible do |dir|
      dir.up {
        user_group = UserGroup.first
        user = user_group.users.first
        prices = PriceLine.all
        prices.each do |price|
          price.user_group = user_group
          price.user = user
          price.save!
        end
      }
    end
  end
end
