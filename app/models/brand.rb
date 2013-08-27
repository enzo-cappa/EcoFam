class Brand < ActiveRecord::Base
  has_many :purchase_lines
end
