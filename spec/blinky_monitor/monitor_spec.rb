require 'spec_helper'
require 'blinky_monitor/monitor'

describe BlinkyMonitor::Monitor do
  before do
    @ci_server = stub 'ci_server'
    @blinky = stub 'blinky'

    @monitor = BlinkyMonitor::Monitor.new @ci_server, @blinky
  end
  
  it 'should tell blinky that it is all good when all projects are successful' do
    @ci_server.should_receive(:status).and_return(:success)
    @blinky.should_receive :success!
    
    @monitor.run
  end

  it 'should tell blinky that bad things are happening when projects are unsuccessful' do
    @ci_server.should_receive(:status).and_return(:failure)
    @blinky.should_receive :failure!

    @monitor.run
  end
end