require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show_creating" do
    get sessions_show_creating_url
    assert_response :success
  end

  test "should get create" do
    get sessions_create_url
    assert_response :success
  end

  test "should get edit" do
    get sessions_edit_url
    assert_response :success
  end

end
