require 'test_helper'

class Yugioh::SetsControllerTest < ActionController::TestCase
  setup do
    @yugioh_set = yugioh_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yugioh_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yugioh_set" do
    assert_difference('Yugioh::Set.count') do
      post :create, yugioh_set: { name: @yugioh_set.name }
    end

    assert_redirected_to yugioh_set_path(assigns(:yugioh_set))
  end

  test "should show yugioh_set" do
    get :show, id: @yugioh_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yugioh_set
    assert_response :success
  end

  test "should update yugioh_set" do
    patch :update, id: @yugioh_set, yugioh_set: { name: @yugioh_set.name }
    assert_redirected_to yugioh_set_path(assigns(:yugioh_set))
  end

  test "should destroy yugioh_set" do
    assert_difference('Yugioh::Set.count', -1) do
      delete :destroy, id: @yugioh_set
    end

    assert_redirected_to yugioh_sets_path
  end
end
