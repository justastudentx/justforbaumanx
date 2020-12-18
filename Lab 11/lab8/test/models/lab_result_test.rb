require 'test_helper'

class LabResultTest < ActiveSupport::TestCase
  def setup
    @one_result = LabResult.new(number: 5, array: "0 1 2 3", double_array: "0 1 4 9", count: 4)
  end

  test 'should save' do
    @one_result.save
  end
  test 'number should be unique' do
    duplicate_one_result = @one_result.dup
    @one_result.save
    assert_not duplicate_one_result.valid?
  end

  test "array should be present" do
    @one_result.array = ""
    assert_not @one_result.valid?
  end

  test "double_array should be present" do
    @one_result.double_array = ""
    assert_not @one_result.valid?
  end
end
