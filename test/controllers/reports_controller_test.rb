require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get highest_cpu" do
    get :highest_cpu
    assert_response :success
  end

end
