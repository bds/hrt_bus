# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hrt_bus/version"

Gem::Specification.new do |s|
  s.name        = "hrt_bus"
  s.version     = HrtBus::VERSION
  s.authors     = ["Brian Douglas Smith"]
  s.email       = ["m.b1205@gmail.com"]
  s.homepage    = "https://github.com/bds/hrt_bus"
  s.summary     = %q{Ruby gem for real-time public HRT bus location data}
  s.description = %q{Ruby gem for real-time public HRT bus location data}

  s.rubyforge_project = "hrt_bus"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "activemodel"
  s.add_dependency "activesupport"
  s.add_dependency "yajl-ruby"
  s.add_dependency "curb"
  s.add_dependency "googlestaticmap"
  s.add_development_dependency "webmock"
  s.add_development_dependency "rspec"
  s.add_development_dependency "interactive_editor"
  s.add_development_dependency "awesome_print"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "factory_girl"
  s.add_development_dependency "forgery"
end
