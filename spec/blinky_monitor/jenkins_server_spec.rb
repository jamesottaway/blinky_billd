require 'spec_helper'
require 'blinky_monitor/jenkins_server'

describe BlinkyMonitor::JenkinsServer do
  shared_context :jenkins do
    let(:stream) { stub 'stream', :read => response }
    subject { BlinkyMonitor::JenkinsServer.new 'build' }
    before { subject.should_receive(:open).with('build/rssLatest').and_return(stream) }
  end

  context 'success' do
    include_context :jenkins
    let(:response) { feed_for 'jenkins_success.xml' }
    its(:status) { should == :success }
  end

  context 'failure' do
    include_context :jenkins
    let(:response) { feed_for 'jenkins_failure.xml' }
    its(:status) { should == :failure }
  end
end