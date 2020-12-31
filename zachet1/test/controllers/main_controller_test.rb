require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  def setup
    # should clear tables
    [Comment, Like, Post, User].map do |model|
      model.destroy_all
    end
  end

  test "should get index" do
    get "/"
    assert_response :success
  end
end
