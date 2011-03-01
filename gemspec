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
  spec.files = Dir['lib/**/*'] + Dir['spec/**/*'] + Dir['bin/*'] + ['README.rdoc', 'MIT-LICENSE', 'HISTORY.rdoc', 'Rakefile', '.gemtest']
  spec.executables << 'shh'

  spec.add_dependency 'flat_hash', '~>0'
  spec.add_dependency 'highline', '~>1.6'
  spec.add_dependency 'uuidtools', '~>2'
  spec.add_dependency 'splat', '~>0'
  spec.add_dependency 'shell_shock', '~>0'
  spec.add_dependency 'activesupport', '~>3'
  spec.add_dependency 'i18n', '~>0'

  spec.add_development_dependency 'rake', '~>0.8'
  spec.add_development_dependency 'gemesis', '~>0'
  spec.add_development_dependency 'rspec', '~>2'
end
