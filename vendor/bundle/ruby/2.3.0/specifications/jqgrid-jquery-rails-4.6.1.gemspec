# -*- encoding: utf-8 -*-
# stub: jqgrid-jquery-rails 4.6.1 ruby lib

Gem::Specification.new do |s|
  s.name = "jqgrid-jquery-rails"
  s.version = "4.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Doc Walker"]
  s.date = "2014-11-27"
  s.description = "Provides the `jqGrid` jQuery plugin packaged for the Rails 3.1+ asset pipeline."
  s.email = ["doc.walker@jameshardie.com"]
  s.homepage = "https://github.com/jhx/gem-jqgrid-jquery-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.2.1"
  s.summary = "Provides the `jqGrid` jQuery plugin packaged for the Rails 3.1+ asset pipeline."

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.1"])
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0"])
      s.add_runtime_dependency(%q<jquery-ui-rails>, [">= 5.0.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.7"])
      s.add_development_dependency(%q<capybara>, ["~> 2.4.3"])
      s.add_development_dependency(%q<coveralls>, ["~> 0.7.1"])
      s.add_development_dependency(%q<launchy>, ["~> 2.4.2"])
      s.add_development_dependency(%q<rails>, ["~> 3.2.14"])
      s.add_development_dependency(%q<rake>, ["~> 10.3.2"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 3.1.0"])
      s.add_development_dependency(%q<rubocop>, ["~> 0.26.1"])
      s.add_development_dependency(%q<semantic>, ["~> 1.3.1"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3.9"])
    else
      s.add_dependency(%q<railties>, [">= 3.1"])
      s.add_dependency(%q<jquery-rails>, [">= 0"])
      s.add_dependency(%q<jquery-ui-rails>, [">= 5.0.0"])
      s.add_dependency(%q<bundler>, ["~> 1.7"])
      s.add_dependency(%q<capybara>, ["~> 2.4.3"])
      s.add_dependency(%q<coveralls>, ["~> 0.7.1"])
      s.add_dependency(%q<launchy>, ["~> 2.4.2"])
      s.add_dependency(%q<rails>, ["~> 3.2.14"])
      s.add_dependency(%q<rake>, ["~> 10.3.2"])
      s.add_dependency(%q<rspec-rails>, ["~> 3.1.0"])
      s.add_dependency(%q<rubocop>, ["~> 0.26.1"])
      s.add_dependency(%q<semantic>, ["~> 1.3.1"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3.9"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.1"])
    s.add_dependency(%q<jquery-rails>, [">= 0"])
    s.add_dependency(%q<jquery-ui-rails>, [">= 5.0.0"])
    s.add_dependency(%q<bundler>, ["~> 1.7"])
    s.add_dependency(%q<capybara>, ["~> 2.4.3"])
    s.add_dependency(%q<coveralls>, ["~> 0.7.1"])
    s.add_dependency(%q<launchy>, ["~> 2.4.2"])
    s.add_dependency(%q<rails>, ["~> 3.2.14"])
    s.add_dependency(%q<rake>, ["~> 10.3.2"])
    s.add_dependency(%q<rspec-rails>, ["~> 3.1.0"])
    s.add_dependency(%q<rubocop>, ["~> 0.26.1"])
    s.add_dependency(%q<semantic>, ["~> 1.3.1"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3.9"])
  end
end
