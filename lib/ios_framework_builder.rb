lib = File.expand_path('..', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'ios_framework_builder/death_runner'
require 'ios_framework_builder/frameworker'
require 'ios_framework_builder/builder'
require 'ios_framework_builder/validator'
require 'ios_framework_builder/smasher'
require 'ios_framework_builder/runner'

