class PurchaseLine < ActiveRecord::Base
  attr_accessible :price_id, :product_id, :purchase_id, :quantity
  belongs_to :product
  belongs_to :purchase
  belongs_to :price
end
