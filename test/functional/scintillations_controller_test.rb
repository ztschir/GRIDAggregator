require 'test_helper'

class ScintillationsControllerTest < ActionController::TestCase
  setup do
    @scintillation = scintillations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scintillations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scintillation" do
    assert_difference('Scintillation.count') do
      post :create, scintillation: @scintillation.attributes
    end

    assert_redirected_to scintillation_path(assigns(:scintillation))
  end

  test "should show scintillation" do
    get :show, id: @scintillation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scintillation
    assert_response :success
  end

  test "should update scintillation" do
    put :update, id: @scintillation, scintillation: @scintillation.attributes
    assert_redirected_to scintillation_path(assigns(:scintillation))
  end

  test "should destroy scintillation" do
    assert_difference('Scintillation.count', -1) do
      delete :destroy, id: @scintillation
    end

    assert_redirected_to scintillations_path
  end
end
