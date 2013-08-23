require 'test_helper'

class SpendsControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  include FactoryGirl::Syntax::Methods
  
  setup do
    @user = create :user
    sign_in :user, @user
    create_default_periods
    @spend = create :spend, user: @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spend" do
    assert_difference('Spend.count') do
      post :create, :spend => @spend.attributes
    end

    assert_redirected_to spends_path
  end

  test "should show spend" do
    get :show, :id => @spend.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @spend.to_param
    assert_response :success
  end

  test "should update spend" do
    put :update, :id => @spend.to_param, :spend => @spend.attributes
    assert_redirected_to spends_path
  end

  test "should destroy spend" do
    assert_difference('Spend.count', -1) do
      delete :destroy, :id => @spend.to_param
    end

    assert_redirected_to spends_path
  end

  test "should get balance" do
    get :balance, {month: 1, year: 2012, format: 'json'}
    assert_response :success
  end
end
