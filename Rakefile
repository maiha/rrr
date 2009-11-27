require 'rubygems'
require 'rake/gempackagetask'

GEM_NAME = "rrr"
AUTHOR = "maiha"
EMAIL = "maiha@wota.jp"
HOMEPAGE = "http://github.com/maiha/rrr"
SUMMARY = "A ruby library for Ruby programming with RR that allows method overload"
GEM_VERSION = "0.1"

spec = Gem::Specification.new do |s|
  s.rubyforge_project = 'asakusa'
  s.name = GEM_NAME
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "MIT-LICENSE"]
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.add_dependency('rrr', '>= 0.10.4')
  s.require_path = 'lib'
  s.files = %w(MIT-LICENSE README Rakefile) + Dir.glob("{lib,spec,app,public,stubs}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Create a gemspec file"
task :gemspec do
  File.open("#{GEM_NAME}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

require 'spec/rake/spectask'
desc 'Default: run spec examples'
task :default => 'spec'
