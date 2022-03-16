require "test_helper"

class PermissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get permissions_index_url
    assert_response :success
  end
end
