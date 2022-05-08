require "test_helper"

class EndUsers::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get end_users_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get end_users_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get end_users_users_update_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get end_users_users_unsubscribe_url
    assert_response :success
  end

  test "should get withdraw" do
    get end_users_users_withdraw_url
    assert_response :success
  end
end
