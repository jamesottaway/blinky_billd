require File.dirname(__FILE__)+'/rspec_helper'
require 'blinky_monitor'

describe BlinkyMonitor do
  JENKINS_URL = 'jenkins url goes here'
  
  before do
    @file = stub 'file'
    @monitor = stub 'monitor'
    @jenkins = stub 'jenkins'
    @blinky = stub 'blinky'
  end
  
  it 'should load configuration from a YAML file' do
    hash = {:url => JENKINS_URL}
    YAML.should_receive(:load_file).with(@file).and_return(hash)
    BlinkyMonitor::JenkinsServer.should_receive(:new).with(JENKINS_URL).and_return(@jenkins)
    Blinky.should_receive(:new).and_return(@blinky)
    BlinkyMonitor::Monitor.should_receive(:new).with(@jenkins, @blinky).and_return(@monitor)
    @monitor.should_receive :run
    BlinkyMonitor.run @file
  end
end