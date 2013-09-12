require 'test_helper'

class PriceLinesControllerTest < ActionController::TestCase
  include FactoryGirl::Syntax::Methods
  include Devise::TestHelpers

  setup do
    @user = create :user
    sign_in :user, @user
    create_default_periods
    @product = create :product
  end
  
  test "should get new" do
    get :new, product_id: @product.id, format: :js
    assert_response :success
  end

  test "should create price line" do
    assert_difference('PriceLine.count') do
      post :create, price_line: {date: Time.now.to_s, market_attributes: {name: "the market"}, price: 10.to_s, brand_attributes: {name: "The Brand"}}, format: :js, product_id: @product.id
    end

    assert_response :success
  end

  test "should get index" do
    get :index, product_id: @product.id, format: :js
    assert_response :success
  end

end
