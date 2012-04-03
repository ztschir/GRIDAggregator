require 'test_helper'

class NavigationSolutionsControllerTest < ActionController::TestCase
  setup do
    @navigation_solution = navigation_solutions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:navigation_solutions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create navigation_solution" do
    assert_difference('NavigationSolution.count') do
      post :create, navigation_solution: @navigation_solution.attributes
    end

    assert_redirected_to navigation_solution_path(assigns(:navigation_solution))
  end

  test "should show navigation_solution" do
    get :show, id: @navigation_solution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @navigation_solution
    assert_response :success
  end

  test "should update navigation_solution" do
    put :update, id: @navigation_solution, navigation_solution: @navigation_solution.attributes
    assert_redirected_to navigation_solution_path(assigns(:navigation_solution))
  end

  test "should destroy navigation_solution" do
    assert_difference('NavigationSolution.count', -1) do
      delete :destroy, id: @navigation_solution
    end

    assert_redirected_to navigation_solutions_path
  end
end
