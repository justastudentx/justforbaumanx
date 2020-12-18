require 'test_helper'

class RegistrationTest < ActionDispatch::IntegrationTest
  test "redirect from index" do 
    get "/"
    assert_response :redirect
  end

  test "can find a result from new authorized user" do 
    post "/create_new_user", params: { name: "user", email: "user@mail.ru", password: "123", another_password: "123" }
    assert_response :redirect

    get "/logout"
    assert_response :redirect

    post "/auth", params: { name: "user", password: "123"}
    assert_response :redirect

    post "/create", params: { number: 5 }
    assert_equal assigns[:array], "0 1 2 3"
  end
end
