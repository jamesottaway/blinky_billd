require 'yaml'
require 'blinky_monitor/monitor'
require 'blinky'
require 'blinky_monitor/jenkins_server'

module BlinkyMonitor
  def self.run file
    config = YAML.load_file file
    jenkins = JenkinsServer.new config[:url]
    blinky = Blinky.new
    
    Monitor.new(jenkins, blinky).run
  end
end