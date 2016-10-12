require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @load = loads(:one)
    @order = orders(:one)
  end

  test "should get index" do
    get :index, params: { load_id: @load }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { load_id: @load }
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, params: { load_id: @load, order: @order.attributes }
    end

    assert_redirected_to load_order_path(@load, Order.last)
  end

  test "should show order" do
    get :show, params: { load_id: @load, id: @order }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { load_id: @load, id: @order }
    assert_response :success
  end

  test "should update order" do
    put :update, params: { load_id: @load, id: @order, order: @order.attributes }
    assert_redirected_to load_order_path(@load, Order.last)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, params: { load_id: @load, id: @order }
    end

    assert_redirected_to load_orders_path(@load)
  end
end
