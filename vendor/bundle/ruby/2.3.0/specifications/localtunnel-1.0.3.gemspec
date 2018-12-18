# -*- encoding: utf-8 -*-
# stub: localtunnel 1.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "localtunnel"
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["DSTIL"]
  s.date = "2016-02-19"
  s.description = "Ruby gem wrapping the localtunnel npm package."
  s.email = ["15gorillas@gmail.com"]
  s.homepage = "https://github.com/dstil/localtunnel"
  s.licenses = ["MIT"]
  s.post_install_message = "Please ensure that the localtunnel npm package is installed (i.e. `npm install -g localtunnel`)."
  s.rubygems_version = "2.5.2.1"
  s.summary = "Ruby gem wrapping the localtunnel npm package."

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.10"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.10"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.10"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
  end
end
