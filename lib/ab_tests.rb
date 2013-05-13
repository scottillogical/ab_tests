require "ab_tests/version"
require 'ab_tests/railtie' if defined?(Rails)

module AbTests

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :user_id_field_name

    def initialize
    end
  end
end
