class Product < ActiveRecord::Base
  has_many :price_lines, inverse_of: :product

  belongs_to :variete
  belongs_to :measure_unit

  validates :name, :presence => true, uniqueness: true

  default_scope {order(:name)}

  def annual_price_rise
    prices = price_lines.where{(date > Time.now - 12.months)}.order('DATE ASC')
    first_price = prices.first
    last_price = prices.last
    unless first_price.nil? 
      result = (last_price.price - first_price.price)* 100 / first_price.price
    else
      result = 0.0
    end
    result = result.to_i unless result.nan?
    return result
  end
end
