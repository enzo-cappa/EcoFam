class Product < ActiveRecord::Base
  attr_accessible :brand_id, :measure_unit_id, :name
  has_many :purchases, :through => :purchase_line
  has_many :prices
  belongs_to :brand
  belonts_to :variete
  belong_to :measure_unit
end
