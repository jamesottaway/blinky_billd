Gem::Specification.new do |spec|
  spec.name = 'blinky_monitor'
  spec.version = '0.0.1'
  spec.summary = "watches a CI server and tells blinky about it"
  spec.description = <<-EOF
watches a CI server and tells blinky about it. dude.
EOF
  spec.authors << 'James Ottaway'
  spec.authors << 'Mark Ryall'
  spec.email = 'james@ottaway.mp'
  spec.homepage = 'http://github.com/jamesottaway/blinky_monitor'
  spec.files = Dir['lib/**/*'] + Dir['spec/**/*'] + Dir['bin/*'] + ['README.rdoc', 'MIT-LICENSE', 'Rakefile']
  spec.executables << 'blink'

  spec.add_development_dependency 'rake', '~>0.8'
  spec.add_development_dependency 'rspec', '~>2'
end
