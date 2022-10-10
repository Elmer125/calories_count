require "test_helper"

class StatiticsControllerTest < ActionDispatch::IntegrationTest
  test "should get graph" do
    get statitics_graph_url
    assert_response :success
  end
end
