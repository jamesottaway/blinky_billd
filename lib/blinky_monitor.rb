require 'rubygems'
require 'yaml'
require 'blinky'

Dir.glob(File.dirname(__FILE__)+'/blinky_monitor/**/*').each {|f| require f}

module BlinkyMonitor
  def self.run file
    config = YAML.load_file file
    server_class = BlinkyMonitor.const_get "#{config['server'].split('_').map(&:capitalize).join}Server"
    server = server_class.new config['url']
    blinky = Blinky.new
    
    Monitor.new(server, blinky).run
  end
end