require 'test_helper'

class OffsetTimesControllerTest < ActionController::TestCase
  setup do
    @offset_time = offset_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offset_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offset_time" do
    assert_difference('OffsetTime.count') do
      post :create, offset_time: @offset_time.attributes
    end

    assert_redirected_to offset_time_path(assigns(:offset_time))
  end

  test "should show offset_time" do
    get :show, id: @offset_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @offset_time
    assert_response :success
  end

  test "should update offset_time" do
    put :update, id: @offset_time, offset_time: @offset_time.attributes
    assert_redirected_to offset_time_path(assigns(:offset_time))
  end

  test "should destroy offset_time" do
    assert_difference('OffsetTime.count', -1) do
      delete :destroy, id: @offset_time
    end

    assert_redirected_to offset_times_path
  end
end
