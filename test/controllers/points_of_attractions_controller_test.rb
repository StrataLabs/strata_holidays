require 'test_helper'

class PointsOfAttractionsControllerTest < ActionController::TestCase
  setup do
    @points_of_attraction = points_of_attractions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:points_of_attractions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create points_of_attraction" do
    assert_difference('PointsOfAttraction.count') do
      post :create, points_of_attraction: { comments: @points_of_attraction.comments, name: @points_of_attraction.name, type: @points_of_attraction.type }
    end

    assert_redirected_to points_of_attraction_path(assigns(:points_of_attraction))
  end

  test "should show points_of_attraction" do
    get :show, id: @points_of_attraction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @points_of_attraction
    assert_response :success
  end

  test "should update points_of_attraction" do
    patch :update, id: @points_of_attraction, points_of_attraction: { comments: @points_of_attraction.comments, name: @points_of_attraction.name, type: @points_of_attraction.type }
    assert_redirected_to points_of_attraction_path(assigns(:points_of_attraction))
  end

  test "should destroy points_of_attraction" do
    assert_difference('PointsOfAttraction.count', -1) do
      delete :destroy, id: @points_of_attraction
    end

    assert_redirected_to points_of_attractions_path
  end
end
