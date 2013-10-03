require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
task :default => :spec

file "./standalone/framework-builder" => FileList.new("lib/ios_framework_builder.rb", "lib/ios_framework_builder/*.rb") do |task|
  $LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
  require 'ios_framework_builder/standalone'
  IOSFrameworkBuilder::Standalone.save("./standalone/framework-builder")
end

desc "Build standalone script"
task :standalone => "./standalone/framework-builder"
