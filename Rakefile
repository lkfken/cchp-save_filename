require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc 'install to geminabox server'
task :install_to_a_box do |task|
  fl = FileList['./pkg/*.gem'].sort
  puts "upload #{fl.last} to geminabox server..."
  system "gem inabox #{fl.last}"
end

task :install_to_a_box => :install