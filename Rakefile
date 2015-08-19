require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)


namespace :sample do
  desc "Build the sample project"
  task :build do
    Dir.chdir("sample") do
      ruby "-S", "rake"
    end
  end
end

task :default => :spec
task :ci => [:spec, 'sample:build']
