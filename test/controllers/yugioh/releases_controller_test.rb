require 'test_helper'

class Yugioh::ReleasesControllerTest < ActionController::TestCase
  setup do
    @yugioh_release = yugioh_releases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yugioh_releases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yugioh_release" do
    assert_difference('Yugioh::Release.count') do
      post :create, yugioh_release: { print_tag: @yugioh_release.print_tag, rarity: @yugioh_release.rarity }
    end

    assert_redirected_to yugioh_release_path(assigns(:yugioh_release))
  end

  test "should show yugioh_release" do
    get :show, id: @yugioh_release
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yugioh_release
    assert_response :success
  end

  test "should update yugioh_release" do
    patch :update, id: @yugioh_release, yugioh_release: { print_tag: @yugioh_release.print_tag, rarity: @yugioh_release.rarity }
    assert_redirected_to yugioh_release_path(assigns(:yugioh_release))
  end

  test "should destroy yugioh_release" do
    assert_difference('Yugioh::Release.count', -1) do
      delete :destroy, id: @yugioh_release
    end

    assert_redirected_to yugioh_releases_path
  end
end
