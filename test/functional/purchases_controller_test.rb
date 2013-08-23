require 'test_helper'

class PurchasesControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  include FactoryGirl::Syntax::Methods
  
  setup do
    @user = create :user
    sign_in :user, @user
    create_default_periods
    @purchase = create :purchase
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase" do
    assert_difference('Purchase.count') do
      post :create, purchase: {purchase_date: Time.now.to_s, market_attributes: {name: "the market"}, purchase_lines_attributes: { "0" => {price: 10.to_s, quantity: 10.to_s, product_attributes: {name: "the product"}, brand_attributes: {name: "The Brand"} }}}
    end

    assert_redirected_to purchase_path(assigns(:purchase))
  end

  test "should show purchase" do
    get :show, id: @purchase
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase
    assert_response :success
  end

  test "should update purchase" do
    put :update, id: @purchase, purchase: {purchase_date: Time.now.to_s }
    assert_redirected_to purchase_path(assigns(:purchase))
  end

  test "should destroy purchase" do
    assert_difference('Purchase.count', -1) do
      delete :destroy, id: @purchase
    end

    assert_redirected_to purchases_path
  end
end
