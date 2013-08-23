require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  test "shouldn't create a product with nil name" do
    product = build :product
    product.name = nil
    assert !product.save
  end

  test "shouldn't create a product with empty name" do
    product = build :product
    product.name = ''
    assert !product.save
  end

end
