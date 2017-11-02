require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :build do
  puts `gem build jyt_pay.gemspec`
end

task :push do
  puts `gem push jyt_pay-#{JytPay::VERSION}.gem`
end

task :publish => [:build, :push]
