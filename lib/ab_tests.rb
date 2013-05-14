require "ab_tests/version"
require 'ab_tests/railtie' if defined?(Rails)

module AbTests

  class << self
    def configuration
      @configuration ||= Configuration.new
    end
  end


  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :unique_identifier

    def initialize
      @unique_identifier = :unique_identifier
    end

  end
end
