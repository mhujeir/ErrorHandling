require "test_helper"

class LeaksControllerTest < ActionDispatch::IntegrationTest
  test "should get missing_item" do
    get leaks_missing_item_url
    assert_response :success
  end

  test "should get controller_error" do
    get leaks_controller_error_url
    assert_response :success
  end

  test "should get db_error" do
    get leaks_db_error_url
    assert_response :success
  end
end
