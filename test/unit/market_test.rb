require 'test_helper'

class MarketTest < ActiveSupport::TestCase
  test "Should not create a Market with empty name" do
    market = Market.new name: ""
    assert !market.save
  end

  test "Should not create a Market with nil name" do
    market = Market.new name: nil
    assert !market.save
  end
end
