require 'test_helper'

class Applications::StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get applications_students_index_url
    assert_response :success
  end

  test "should get show" do
    get applications_students_show_url
    assert_response :success
  end

  test "should get accept" do
    get applications_students_accept_url
    assert_response :success
  end

  test "should get reject" do
    get applications_students_reject_url
    assert_response :success
  end

end
