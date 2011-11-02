require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = 'blinky_monitor'
  gem.homepage = 'http://github.com/jamesottaway/blinky_monitor'
  gem.license = 'MIT'
  gem.summary = 'watches a CI server and tells blinky about it'
  gem.description = 'watches a CI server and tells blinky about it. dude.'
  gem.email = 'james@ottaway.mp'
  gem.authors = ['James Ottaway', 'Mark Ryall']
end
Jeweler::RubygemsDotOrgTasks.new