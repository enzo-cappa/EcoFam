class Price < ActiveRecord::Base
#  attr_accessible :ammount, :market_id, :special
  belongs_to :product
  has_many :purchase_lines
end
