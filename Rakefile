require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color', '--format', 'doc']
end

task :console do
  require 'irb'
  require 'irb/completion'
  require 'payment'
  ARGV.clear
  IRB.start
end

task default: :spec
