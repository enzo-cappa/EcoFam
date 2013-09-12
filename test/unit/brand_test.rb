require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  test "Should not create a brand with empty name" do
    brand = Brand.new name: ""
    assert !brand.save
  end

  test "Should not create a brand with nil name" do
    brand = Brand.new name: nil
    assert !brand.save
  end
end
