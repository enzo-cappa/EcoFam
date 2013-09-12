class PriceLine < ActiveRecord::Base
  belongs_to :product, inverse_of: :price_lines
  belongs_to :brand, inverse_of: :price_lines
  belongs_to :market, inverse_of: :price_lines
  belongs_to :user_group, inverse_of: :price_lines
  belongs_to :user, inverse_of: :price_lines
  
  validates :brand_id, presence: true
  validates :product_id, presence: true
  validates :market_id, presence: true
  validates :user_group_id, presence: true
  validates :user_id, presence: true
  validates :date, presence: true
  validates :price, presence: true, numericality: true

  def product_with_default
    product_without_default || Product.new
  end

  def brand_with_default
    brand_without_default || Brand.new
  end

  def market_with_default
    market_without_default || Market.new
  end

  alias_method_chain :product, :default
  alias_method_chain :brand, :default
  alias_method_chain :market, :default
  
  def product_attributes=(product)
    if product[:id]
      self.product = Product.find(product[:id])
    else
      self.product = Product.where(:name => product[:name]).first_or_create
    end
  end

  def brand_attributes=(brand)
    self.brand = Brand.where(:name => brand[:name]).first_or_create
  end

  def market_attributes=(market)
    self.market = Market.where(:name => market[:name]).first_or_create
  end
end
