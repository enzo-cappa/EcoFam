class Product < ActiveRecord::Base
  has_many :purchases, :through => :purchase_line
  has_many :purchase_lines
  belongs_to :variete
  belongs_to :measure_unit

  validates :name, :presence => true, uniqueness: true
end
