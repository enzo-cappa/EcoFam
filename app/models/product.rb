class Product < ActiveRecord::Base
  has_many :purchase_lines, inverse_of: :product
  has_many :purchases, :through => :purchase_lines
  belongs_to :variete
  belongs_to :measure_unit

  validates :name, :presence => true, uniqueness: true
end
