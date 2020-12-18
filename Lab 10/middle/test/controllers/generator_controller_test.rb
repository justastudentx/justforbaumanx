require 'test_helper'

class GeneratorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get generator_index_url
    assert_response :success
  end

  test "should get create" do
    get generator_create_url
    assert_response :success
  end

end
