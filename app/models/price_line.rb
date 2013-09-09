class PriceLine < ActiveRecord::Base
  belongs_to :product, inverse_of: :price_lines
  belongs_to :brand, inverse_of: :price_lines
  belongs_to :market, inverse_of: :price_lines
  
  validates :brand_id, presence: true
  validates :product_id, presence: true
  validates :market_id, presence: true
  validates :date, presence: true

  def product_with_default
    product_without_default || Product.new
  end

  def brand_with_default
    brand_without_default || Brand.new
  end

  alias_method_chain :product, :default
  alias_method_chain :brand, :default
  
  def product_attributes=(product)
    self.product = Product.where(:name => product[:name]).first_or_create
  end

  def brand_attributes=(brand)
    self.brand = Brand.where(:name => brand[:name]).first_or_create
  end

end
