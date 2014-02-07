class Product < ActiveRecord::Base
  has_many :price_lines, inverse_of: :product
  has_many :brands, through: :price_lines

  belongs_to :variete
  belongs_to :measure_unit

  validates :name, :presence => true, uniqueness: true

  default_scope {order(:name)}

  def annual_price_rise
    result = {}
    for brand in self.brands
      prices = price_lines.where{(date > Time.now - 12.months) & (brand_id == brand.id)}.order('DATE ASC')
      first_price = prices.first
      last_price = prices.last
      unless first_price.nil?
        result[brand] = (last_price.price - first_price.price)* 100 / first_price.price
      else
        result[brand] = 0.0
      end
    end
    return result
  end
end
