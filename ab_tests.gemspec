# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ab_tests/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Scott Schulthess"]
  gem.email         = ["scottschulthess@gmail.com"]
  gem.description   = %q{A small rails gem for creating and recording A/B Tests}
  gem.summary       = %q{This gem creates a table called variations and then provides a view helper to define a/b tests and record them on the fly}
  gem.homepage      = ""
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ab_tests"
  gem.require_paths = ["lib"]
  gem.version       = AbTests::VERSION
end
