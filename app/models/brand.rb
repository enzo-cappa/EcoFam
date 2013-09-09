class Brand < ActiveRecord::Base
  has_many :price_lines, inverse_of: :brand
end
