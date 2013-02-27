class Product < ActiveRecord::Base
  attr_accessible :brand_id, :measure_unit_id, :name
  has_many :purchases, :through => :purchase_line
  has_many :prices
  belongs_to :brand
  belongs_to :variete
  belongs_to :measure_unit

  validates :name, :presence => true
  validates :brand_id, :presence => true
end
