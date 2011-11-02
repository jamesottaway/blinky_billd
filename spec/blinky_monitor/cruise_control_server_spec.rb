require 'spec_helper'
require 'blinky_monitor/cruise_control_server'

describe BlinkyMonitor::CruiseControlServer do
  shared_context :cruise_control do
    let(:stream) { stub 'stream', :read => response }
    subject { BlinkyMonitor::CruiseControlServer.new 'build' }
    before { subject.should_receive(:open).with('build/cc.xml').and_return(stream) }
  end

  context 'success' do
    include_context :cruise_control
    let(:response) { feed_for 'cruise_control_success.xml' }
    its(:status) { should == :success }
  end
  
  context 'failure' do
    include_context :cruise_control
    let(:response) { feed_for 'cruise_control_failure.xml' }
    its(:status) { should == :failure }
  end

  context 'failure > success' do
    include_context :cruise_control
    let(:response) { feed_for 'cruise_control_success_and_failure.xml' }
    its(:status) { should == :failure }
  end

  context 'building > success' do
    include_context :cruise_control
    let(:response) { feed_for 'cruise_control_building_after_success.xml' }
    its(:status) { should == :building }
  end

  context 'building > failure' do
    include_context :cruise_control
    let(:response) { feed_for 'cruise_control_building_after_failure.xml' }
    its(:status) { should == :building }
  end
end