require 'test_helper'

class ReferersControllerTest < ActionController::TestCase
  setup do
    @referer = referers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:referers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referer" do
    assert_difference('Referer.count') do
      post :create, referer: { name: @referer.name }
    end

    assert_redirected_to referer_path(assigns(:referer))
  end

  test "should show referer" do
    get :show, id: @referer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @referer
    assert_response :success
  end

  test "should update referer" do
    put :update, id: @referer, referer: { name: @referer.name }
    assert_redirected_to referer_path(assigns(:referer))
  end

  test "should destroy referer" do
    assert_difference('Referer.count', -1) do
      delete :destroy, id: @referer
    end

    assert_redirected_to referers_path
  end
end
