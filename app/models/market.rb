class Market < ActiveRecord::Base
  has_many :purchases, inverse_of: :market
  belongs_to :market_brand
  validates :name, :presence => true
end
