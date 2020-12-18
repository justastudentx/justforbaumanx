require 'test_helper'

class BaseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/"
    assert_response :success
  end

  test "should get 5 5 25 for create entered data" do
    post "/create", params: { number: 5 }
    assert_equal assigns[:array], "0 1 2 3"
  end

end
