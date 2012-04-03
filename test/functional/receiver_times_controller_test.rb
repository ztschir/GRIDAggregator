require 'test_helper'

class ReceiverTimesControllerTest < ActionController::TestCase
  setup do
    @receiver_time = receiver_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receiver_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receiver_time" do
    assert_difference('ReceiverTime.count') do
      post :create, receiver_time: @receiver_time.attributes
    end

    assert_redirected_to receiver_time_path(assigns(:receiver_time))
  end

  test "should show receiver_time" do
    get :show, id: @receiver_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receiver_time
    assert_response :success
  end

  test "should update receiver_time" do
    put :update, id: @receiver_time, receiver_time: @receiver_time.attributes
    assert_redirected_to receiver_time_path(assigns(:receiver_time))
  end

  test "should destroy receiver_time" do
    assert_difference('ReceiverTime.count', -1) do
      delete :destroy, id: @receiver_time
    end

    assert_redirected_to receiver_times_path
  end
end
