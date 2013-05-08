class PurchaseLine < ActiveRecord::Base
  attr_accessible :price_id, :purchase_id, :quantity, :product_attributes
  belongs_to :product
  belongs_to :purchase
  belongs_to :price
  belongs_to :brand
  accepts_nested_attributes_for :product

  def product_with_default
    product_without_default || Product.new
  end

  alias_method_chain :product, :default
end
