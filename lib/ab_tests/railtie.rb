require 'ab_tests/view_helpers'
module AbTests
  class Railtie < Rails::Railtie
    initializer "ab_tests.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
