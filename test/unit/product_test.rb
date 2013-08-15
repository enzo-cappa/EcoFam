require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  # test "the truth" do
  #   assert true
  # end

  test "shouldn't create a product with nil name" do
    product = products(:one)
    product.name = nil
    assert !product.save
  end

  test "shouldn't create a product with empty name" do
    product = products(:one)
    product.name = ''
    assert !product.save
  end

end
