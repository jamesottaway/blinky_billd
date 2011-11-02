require File.dirname(__FILE__)+'/../rspec_helper'
require 'blinky_monitor/cruise_control_server'

describe BlinkyMonitor::CruiseControlServer do
  before do
    @server = BlinkyMonitor::CruiseControlServer.new 'build'
  end
  
  it 'should return success if the project is successful' do
    response = <<EOF
    <Projects>
<Project webUrl="http://build/job/green/" name="green" lastBuildLabel="1" lastBuildTime="2011-12-30T12:00:00Z" lastBuildStatus="Success" activity="Sleeping"/>
</Projects>
EOF
    
    @server.should_receive(:open).with('build/cc.xml').and_return(response)
    @server.status.should == :success
  end
  
  it 'should return failure if the projects fails' do
    response = <<EOF
    <Projects>
<Project webUrl="http://build/job/red/" name="red" lastBuildLabel="1" lastBuildTime="2011-12-30T12:00:00Z" lastBuildStatus="Failure" activity="Sleeping"/>
</Projects>
EOF
    
    @server.should_receive(:open).with('build/cc.xml').and_return(response)
    @server.status.should == :failure
  end

  it 'should return failure if one project is successful but another is failing' do
    response = <<EOF
    <Projects>
<Project webUrl="http://build/job/green/" name="green" lastBuildLabel="1" lastBuildTime="2011-12-30T12:00:00Z" lastBuildStatus="Success" activity="Sleeping"/>
<Project webUrl="http://build/job/red/" name="red" lastBuildLabel="1" lastBuildTime="2011-12-30T12:00:00Z" lastBuildStatus="Failure" activity="Sleeping"/>
</Projects>
EOF
    
    @server.should_receive(:open).with('build/cc.xml').and_return(response)
    @server.status.should == :failure
  end

  it 'should return building if a previously successful project is building' do
    response = <<EOF
    <Projects>
<Project webUrl="http://build/job/green/" name="green" lastBuildLabel="1" lastBuildTime="2011-12-30T12:00:00Z" lastBuildStatus="Success" activity="Building"/>
</Projects>
EOF
    
    @server.should_receive(:open).with('build/cc.xml').and_return(response)
    @server.status.should == :building
  end

  it 'should return building if a previously failed project is building' do
    response = <<EOF
    <Projects>
<Project webUrl="http://build/job/green/" name="green" lastBuildLabel="1" lastBuildTime="2011-12-30T12:00:00Z" lastBuildStatus="Failure" activity="Building"/>
</Projects>
EOF
    
    @server.should_receive(:open).with('build/cc.xml').and_return(response)
    @server.status.should == :building
  end
end