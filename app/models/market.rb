class Market < ActiveRecord::Base
  attr_accessible :market_brand_id, :name
  has_many :purchases
  belong_to :market_brand
end
