require "test_helper"

class HealthzControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get healthz_index_url
    assert_response :success
  end
end
