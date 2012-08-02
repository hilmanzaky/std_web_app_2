require 'test_helper'

class HeaderLinksControllerTest < ActionController::TestCase
  setup do
    @header_link = header_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:header_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create header_link" do
    assert_difference('HeaderLink.count') do
      post :create, header_link: { name: @header_link.name }
    end

    assert_redirected_to header_link_path(assigns(:header_link))
  end

  test "should show header_link" do
    get :show, id: @header_link
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @header_link
    assert_response :success
  end

  test "should update header_link" do
    put :update, id: @header_link, header_link: { name: @header_link.name }
    assert_redirected_to header_link_path(assigns(:header_link))
  end

  test "should destroy header_link" do
    assert_difference('HeaderLink.count', -1) do
      delete :destroy, id: @header_link
    end

    assert_redirected_to header_links_path
  end
end
