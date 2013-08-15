class PurchaseLine < ActiveRecord::Base
  belongs_to :product
  belongs_to :purchase
  belongs_to :brand
  before_validation :update_subtotal

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

  def price=(price)
    write_attribute :price, price
    update_subtotal    
  end

  def quantity=(quantity)
    write_attribute :quantity, quantity
    update_subtotal
  end
  
  private
  def update_subtotal
    write_attribute :subtotal, read_attribute(:price) * read_attribute(:quantity)
  end
end
