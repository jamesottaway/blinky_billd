require 'rubygems'
require 'yaml'
require 'blinky_monitor/monitor'
require 'blinky'
require 'blinky_monitor/jenkins_server'

module BlinkyMonitor
  def self.run file
    config = YAML.load_file file
    server_class = BlinkyMonitor.const_get "#{config[:server].split('_').map(&:capitalize).join}Server"
    server = server_class.new config[:url]
    blinky = Blinky.new
    
    Monitor.new(server, blinky).run
  end
end