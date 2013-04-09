class Purchase < ActiveRecord::Base
  attr_accessible :market_id, :total
  has_many :products, :through  => :purchase_line
  has_many :purchase_lines
  belongs_to :market
end