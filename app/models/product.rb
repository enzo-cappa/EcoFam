class Product < ActiveRecord::Base
  attr_accessible :brand_id, :measure_unit_id, :name
end
