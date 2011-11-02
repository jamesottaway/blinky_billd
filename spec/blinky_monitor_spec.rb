require 'spec_helper'
require 'blinky_monitor'
require 'hipster_server'

describe BlinkyMonitor do
  CI_TYPE = 'hipster' # you've probably never heard of it...
  CI_URL = 'http://ci/'
  
  before do
    @file = stub 'file'
    @monitor = stub 'monitor'
    @jenkins = stub 'jenkins'
    @blinky = stub 'blinky'
  end
  
  it 'should load configuration from a YAML file' do
    hash = {:server => CI_TYPE, :url => CI_URL}
    YAML.should_receive(:load_file).with(@file).and_return(hash)
    BlinkyMonitor.should_receive(:const_get).with('HipsterServer').and_return BlinkyMonitor::HipsterServer
    BlinkyMonitor::HipsterServer.should_receive(:new).with(CI_URL).and_return(@server)
    Blinky.should_receive(:new).and_return(@blinky)
    BlinkyMonitor::Monitor.should_receive(:new).with(@server, @blinky).and_return(@monitor)
    @monitor.should_receive :run
    BlinkyMonitor.run @file
  end
end