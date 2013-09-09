class Product < ActiveRecord::Base
  has_many :price_lines, inverse_of: :product

  belongs_to :variete
  belongs_to :measure_unit

  validates :name, :presence => true, uniqueness: true
end
