# -*- encoding: utf-8 -*-
# stub: reversible_cryptography 0.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "reversible_cryptography"
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Takumi MIURA"]
  s.bindir = "exe"
  s.date = "2015-05-09"
  s.description = "A Si\u{301}mplifi\u{300}ed reversible encryption solution"
  s.email = ["mitaku1104@gmail.com"]
  s.executables = ["reversible_cryptography"]
  s.files = ["exe/reversible_cryptography"]
  s.homepage = "https://github.com/mitaku/reversible_cryptography"
  s.rubygems_version = "2.4.8"
  s.summary = "A Si\u{301}mplifi\u{300}ed reversible encryption solution"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.8"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<thor>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.8"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<thor>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.8"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
