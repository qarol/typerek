require 'test_helper'

class RoundsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
