require 'spec_helper'
require 'ab_tests/view_helpers'
include AbTests::ViewHelpers
describe AbTests::ViewHelpers do

  it "succeeds" do
    lambda { ab_test('xyz', ['1', '2', '3'], 1) { |chosen_variation| 'test'} }.should_not raise_error
  end

  it "chooses a variation" do
    result = ab_test('xyz', ['1', '2', '3'], 1) do |chosen_variation| 
      raise "no chosen variation" unless chosen_variation
    end
  end

  it "returns a result" do 
    result = ab_test('xyz', ['1', '2', '3'], 1) do |chosen_variation| 
      'test'
    end
    result.should eql 'test'
  end

end
