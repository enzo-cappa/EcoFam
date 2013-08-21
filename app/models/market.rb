class Market < ActiveRecord::Base
#  attr_accessible :market_brand_id, :name
  has_many :purchases
  has_many :purchase_lines, :through => :purchases
  belongs_to :market_brand
  validates :name, :presence => true
end
