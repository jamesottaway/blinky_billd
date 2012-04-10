# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "blinky_billd/version"

Gem::Specification.new do |s|
  s.name        = "blinky_billd"
  s.version     = BlinkyBilld::VERSION
  s.authors     = ["James Ottaway"]
  s.email       = ["james@ottaway.mp"]
  s.homepage    = ""
  s.summary     = %q{Blinky + Billd}
  s.description = %q{Blinky is great for controlling a build light, and Billd can tell you how healthy your builds are.
    Wouldn't it be nice if they placed nicely together? Well now they do!}

  s.rubyforge_project = "blinky_billd"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"

  s.add_runtime_dependency 'blinky'
  s.add_runtime_dependency 'billd'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
