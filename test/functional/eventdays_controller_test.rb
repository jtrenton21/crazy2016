require 'test_helper'

class EventdaysControllerTest < ActionController::TestCase
  setup do
    @eventday = eventdays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:eventdays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create eventday" do
    assert_difference('Eventday.count') do
      post :create, eventday: { day: @eventday.day }
    end

    assert_redirected_to eventday_path(assigns(:eventday))
  end

  test "should show eventday" do
    get :show, id: @eventday
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @eventday
    assert_response :success
  end

  test "should update eventday" do
    put :update, id: @eventday, eventday: { day: @eventday.day }
    assert_redirected_to eventday_path(assigns(:eventday))
  end

  test "should destroy eventday" do
    assert_difference('Eventday.count', -1) do
      delete :destroy, id: @eventday
    end

    assert_redirected_to eventdays_path
  end
end
