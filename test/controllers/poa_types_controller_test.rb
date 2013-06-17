require 'test_helper'

class PoaTypesControllerTest < ActionController::TestCase
  setup do
    @poa_type = poa_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poa_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poa_type" do
    assert_difference('PoaType.count') do
      post :create, poa_type: { comments: @poa_type.comments, description: @poa_type.description, meant_fof: @poa_type.meant_fof, time_can_be_spent: @poa_type.time_can_be_spent, type: @poa_type.type }
    end

    assert_redirected_to poa_type_path(assigns(:poa_type))
  end

  test "should show poa_type" do
    get :show, id: @poa_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poa_type
    assert_response :success
  end

  test "should update poa_type" do
    patch :update, id: @poa_type, poa_type: { comments: @poa_type.comments, description: @poa_type.description, meant_fof: @poa_type.meant_fof, time_can_be_spent: @poa_type.time_can_be_spent, type: @poa_type.type }
    assert_redirected_to poa_type_path(assigns(:poa_type))
  end

  test "should destroy poa_type" do
    assert_difference('PoaType.count', -1) do
      delete :destroy, id: @poa_type
    end

    assert_redirected_to poa_types_path
  end
end
