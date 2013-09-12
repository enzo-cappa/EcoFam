class UserGroup < ActiveRecord::Base
  has_many :users, inverse_of: :user_group
  has_many :spends, inverse_of: :user_group
  has_many :purchases, inverse_of: :user_group
  has_many :price_lines, inverse_of: :user_group
end
