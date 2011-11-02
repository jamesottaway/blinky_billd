require File.dirname(__FILE__)+'/../rspec_helper'
require 'blinky_monitor/jenkins_server'

describe BlinkyMonitor::JenkinsServer do
  context 'success' do
    let(:response) { feed_for 'jenkins_success.xml' }
    let(:stream) { stub 'stream', :read => response }

    subject { BlinkyMonitor::JenkinsServer.new 'build' }

    before { subject.should_receive(:open).with('build/rssLatest').and_return(stream) }
    its(:status) { should == :success }
  end

  context 'failure' do
    let(:response) { feed_for 'jenkins_failure.xml' }
    let(:stream) { stub 'stream', :read => response }

    subject { BlinkyMonitor::JenkinsServer.new 'build' }

    before { subject.should_receive(:open).with('build/rssLatest').and_return(stream) }
    its(:status) { should == :failure }
  end
end