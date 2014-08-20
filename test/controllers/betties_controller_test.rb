require 'test_helper'

class BettiesControllerTest < ActionController::TestCase
  setup do
    @betty = betties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:betties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create betty" do
    assert_difference('Betty.count') do
      post :create, betty: { description: @betty.description }
    end

    assert_redirected_to betty_path(assigns(:betty))
  end

  test "should show betty" do
    get :show, id: @betty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @betty
    assert_response :success
  end

  test "should update betty" do
    patch :update, id: @betty, betty: { description: @betty.description }
    assert_redirected_to betty_path(assigns(:betty))
  end

  test "should destroy betty" do
    assert_difference('Betty.count', -1) do
      delete :destroy, id: @betty
    end

    assert_redirected_to betties_path
  end
end
