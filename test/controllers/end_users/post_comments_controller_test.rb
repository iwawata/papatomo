require "test_helper"

class EndUsers::PostCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get end_users_post_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get end_users_post_comments_destroy_url
    assert_response :success
  end
end
