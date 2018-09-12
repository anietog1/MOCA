require 'test_helper'

class UndergraduatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @undergraduate = undergraduates(:one)
  end

  test "should get index" do
    get undergraduates_url
    assert_response :success
  end

  test "should get new" do
    get new_undergraduate_url
    assert_response :success
  end

  test "should create undergraduate" do
    assert_difference('Undergraduate.count') do
      post undergraduates_url, params: { undergraduate: { name: @undergraduate.name } }
    end

    assert_redirected_to undergraduate_url(Undergraduate.last)
  end

  test "should show undergraduate" do
    get undergraduate_url(@undergraduate)
    assert_response :success
  end

  test "should get edit" do
    get edit_undergraduate_url(@undergraduate)
    assert_response :success
  end

  test "should update undergraduate" do
    patch undergraduate_url(@undergraduate), params: { undergraduate: { name: @undergraduate.name } }
    assert_redirected_to undergraduate_url(@undergraduate)
  end

  test "should destroy undergraduate" do
    assert_difference('Undergraduate.count', -1) do
      delete undergraduate_url(@undergraduate)
    end

    assert_redirected_to undergraduates_url
  end
end
