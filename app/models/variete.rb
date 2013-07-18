class Variete < ActiveRecord::Base
#  attr_accessible :name, :product_id
  has_many :products
end
