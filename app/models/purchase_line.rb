class PurchaseLine < ActiveRecord::Base
#  attr_accessible :price_id, :purchase_id, :quantity, :product_attributes
  belongs_to :product
  belongs_to :purchase
  belongs_to :brand
  accepts_nested_attributes_for :product
  before_save :update_subtotal

  def product_with_default
    product_without_default || Product.new
  end
  
  def product_attributes=(product)
    self.product = Product.where(:name => product[:name]).first_or_create()
  end

  alias_method_chain :product, :default

  private
  def update_subtotal
    self.subtotal = self.price * self.quantity
  end
end
