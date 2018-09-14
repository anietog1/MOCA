require 'test_helper'

class Applications::AdvisorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get applications_advisors_index_url
    assert_response :success
  end

  test "should get show" do
    get applications_advisors_show_url
    assert_response :success
  end

  test "should get update" do
    get applications_advisors_update_url
    assert_response :success
  end

end
