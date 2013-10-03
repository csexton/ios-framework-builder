# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ios_framework_builder/version'

Gem::Specification.new do |gem|
  gem.name          = "ios_framework_builder"
  gem.version       = IOSFrameworkBuilder::VERSION
  gem.authors       = ["Christopher Sexton"]
  gem.email         = ["github@codeography.com"]
  gem.description   = %q{Build Script for creating a Cocoa .framework bundle}
  gem.summary       = %q{Build Script for creating a Cocoa .framework bundle}
  gem.homepage      = "https://github.com/csexton/ios-framework-builder"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency('rspec')
  gem.add_development_dependency('pry')
  gem.add_development_dependency('rake')
end
