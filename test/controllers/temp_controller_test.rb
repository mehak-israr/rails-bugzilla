require 'test_helper'

class TempControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get temp_home_url
    assert_response :success
  end

end
