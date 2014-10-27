require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.libs << "spec"
  t.test_files = FileList['spec/*_spec.rb']
  t.verbose = false
end

desc "run tests"
task :default => :test

