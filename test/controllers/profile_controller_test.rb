require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get me" do
    get profile_me_url
    assert_response :success
  end
end
