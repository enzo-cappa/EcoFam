class MarketBrand < ActiveRecord::Base
#  attr_accessible :name
  has_many :markets
end
