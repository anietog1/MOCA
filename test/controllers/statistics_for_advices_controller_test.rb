require 'test_helper'

class StatisticsForAdvicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get statistics_for_advices_index_url
    assert_response :success
  end

end
