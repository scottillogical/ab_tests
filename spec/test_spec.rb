require 'spec_helper'
require 'ab_tests/view_helpers'
include AbTests::ViewHelpers
describe ViewHelpers do

  it "succeeds" do
    lambda { ab_test('xyz', ['1', '2', '3']) }.should_not raise_error
  end
end
