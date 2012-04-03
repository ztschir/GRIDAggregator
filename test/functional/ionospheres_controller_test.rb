require 'test_helper'

class IonospheresControllerTest < ActionController::TestCase
  setup do
    @ionosphere = ionospheres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ionospheres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ionosphere" do
    assert_difference('Ionosphere.count') do
      post :create, ionosphere: @ionosphere.attributes
    end

    assert_redirected_to ionosphere_path(assigns(:ionosphere))
  end

  test "should show ionosphere" do
    get :show, id: @ionosphere
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ionosphere
    assert_response :success
  end

  test "should update ionosphere" do
    put :update, id: @ionosphere, ionosphere: @ionosphere.attributes
    assert_redirected_to ionosphere_path(assigns(:ionosphere))
  end

  test "should destroy ionosphere" do
    assert_difference('Ionosphere.count', -1) do
      delete :destroy, id: @ionosphere
    end

    assert_redirected_to ionospheres_path
  end
end
