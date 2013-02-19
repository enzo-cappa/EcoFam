class PurchaseLine < ActiveRecord::Base
  attr_accessible :price_id, :product_id, :purchase_id, :quantity
end
