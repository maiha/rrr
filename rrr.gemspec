# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rrr}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["maiha"]
  s.date = %q{2009-11-27}
  s.description = %q{A ruby library for Ruby programming with RR that allows method overload}
  s.email = %q{maiha@wota.jp}
  s.extra_rdoc_files = ["README", "MIT-LICENSE"]
  s.files = ["MIT-LICENSE", "README", "Rakefile", "lib/rrr.rb", "spec/im_spec.rb", "spec/cm_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/maiha/rrr}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{asakusa}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A ruby library for Ruby programming with RR that allows method overload}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rrr>, [">= 0.10.4"])
    else
      s.add_dependency(%q<rrr>, [">= 0.10.4"])
    end
  else
    s.add_dependency(%q<rrr>, [">= 0.10.4"])
  end
end
