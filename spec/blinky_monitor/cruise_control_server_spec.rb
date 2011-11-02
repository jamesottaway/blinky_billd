require File.dirname(__FILE__)+'/../rspec_helper'
require 'blinky_monitor/cruise_control_server'

describe BlinkyMonitor::CruiseControlServer do
  context 'success' do
    let(:response) { feed_for 'cruise_control_success.xml' }
    let(:stream) { stub 'stream', :read => response }

    subject { BlinkyMonitor::CruiseControlServer.new 'build' }

    before { subject.should_receive(:open).with('build/cc.xml').and_return(stream) }
    its(:status) { should == :success }
  end
  
  context 'failure' do
    let(:response) { feed_for 'cruise_control_failure.xml' }
    let(:stream) { stub 'stream', :read => response }

    subject { BlinkyMonitor::CruiseControlServer.new 'build' }

    before { subject.should_receive(:open).with('build/cc.xml').and_return(stream) }
    its(:status) { should == :failure }
  end

  context 'failure > success' do
    let(:response) { feed_for 'cruise_control_success_and_failure.xml' }
    let(:stream) { stub 'stream', :read => response }

    subject { BlinkyMonitor::CruiseControlServer.new 'build' }

    before { subject.should_receive(:open).with('build/cc.xml').and_return(stream) }
    its(:status) { should == :failure }
  end

  context 'building > success' do
    let(:response) { feed_for 'cruise_control_building_after_success.xml' }
    let(:stream) { stub 'stream', :read => response }

    subject { BlinkyMonitor::CruiseControlServer.new 'build' }

    before { subject.should_receive(:open).with('build/cc.xml').and_return(stream) }
    its(:status) { should == :building }
  end

  context 'building > failure' do
    let(:response) { feed_for 'cruise_control_building_after_failure.xml' }
    let(:stream) { stub 'stream', :read => response }

    subject { BlinkyMonitor::CruiseControlServer.new 'build' }

    before { subject.should_receive(:open).with('build/cc.xml').and_return(stream) }
    its(:status) { should == :building }
  end
end