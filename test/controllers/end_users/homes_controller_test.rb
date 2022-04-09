require "test_helper"

class EndUsers::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get end_users_homes_top_url
    assert_response :success
  end
end
