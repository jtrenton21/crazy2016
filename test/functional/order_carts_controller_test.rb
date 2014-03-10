require 'test_helper'

class OrderCartsControllerTest < ActionController::TestCase
  setup do
    @order_cart = order_carts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_cart" do
    assert_difference('OrderCart.count') do
      post :create, order_cart: { purchased_at: @order_cart.purchased_at }
    end

    assert_redirected_to order_cart_path(assigns(:order_cart))
  end

  test "should show order_cart" do
    get :show, id: @order_cart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_cart
    assert_response :success
  end

  test "should update order_cart" do
    put :update, id: @order_cart, order_cart: { purchased_at: @order_cart.purchased_at }
    assert_redirected_to order_cart_path(assigns(:order_cart))
  end

  test "should destroy order_cart" do
    assert_difference('OrderCart.count', -1) do
      delete :destroy, id: @order_cart
    end

    assert_redirected_to order_carts_path
  end
end
