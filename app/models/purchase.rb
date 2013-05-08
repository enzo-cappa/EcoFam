class Purchase < ActiveRecord::Base
  attr_accessible :purchase_date, :market_id, :total, :purchase_lines_attributes, :market_attributes
  has_many :products, :through  => :purchase_line
  has_many :purchase_lines
  belongs_to :market
  accepts_nested_attributes_for :purchase_lines

  def market_attributes=(market)
    Market.where(:name => market[:name]).first_or_create()
  end
end
