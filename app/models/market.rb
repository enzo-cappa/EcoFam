class Market < ActiveRecord::Base
#  attr_accessible :market_brand_id, :name
  has_many :purchases
  belongs_to :market_brand
  validates :name, :presence => true
end
