require File.dirname(__FILE__)+'/../rspec_helper'
require 'blinky_monitor/jenkins_server'

describe BlinkyMonitor::JenkinsServer do
  before do
    @jenkins = BlinkyMonitor::JenkinsServer.new 'http://10.7.13.12:8090'
  end
  
  it 'should return success if all projects are successful' do
    response = <<EOF
    <?xml version="1.0" encoding="UTF-8"?>
    <feed xmlns="http://www.w3.org/2005/Atom">
    	<title>All last builds only</title>
    	<link type="text/html" href="http://localhost:8080/" rel="alternate"/>
    	<updated>2011-02-23T00:08:34Z</updated>
    	<author>
    		<name>Jenkins Server</name>
    	</author>
    	<id>urn:uuid:903deee0-7bfa-11db-9fe1-0800200c9a66</id>
    	<entry>
    		<title>cas #87 (stable)</title>
    		<link type="text/html" href="http://localhost:8080/job/cas/87/" rel="alternate"/>
    		<id>tag:hudson.dev.java.net,2008:http://localhost:8080/job/cas/</id>
    		<published>2011-02-23T00:08:34Z</published>
    		<updated>2011-02-23T00:08:34Z</updated>
    	</entry>
    </feed>
EOF
    
    @jenkins.should_receive(:open).with('http://10.7.13.12:8090/rssLatest').and_return(response)
    @jenkins.status.should == :success
  end
  
  it "should return failure if one of the projects fails" do
    response = <<EOF
    <?xml version="1.0" encoding="UTF-8"?>
    <feed xmlns="http://www.w3.org/2005/Atom">
    	<title>All last builds only</title>
    	<link type="text/html" href="http://localhost:8080/" rel="alternate"/>
    	<updated>2011-02-23T00:08:34Z</updated>
    	<author>
    		<name>Jenkins Server</name>
    	</author>
    	<id>urn:uuid:903deee0-7bfa-11db-9fe1-0800200c9a66</id>
    	<entry>
    		<title>cas #87 (broken since build #1)</title>
    		<link type="text/html" href="http://localhost:8080/job/cas/87/" rel="alternate"/>
    		<id>tag:hudson.dev.java.net,2008:http://localhost:8080/job/cas/</id>
    		<published>2011-02-23T00:08:34Z</published>
    		<updated>2011-02-23T00:08:34Z</updated>
    	</entry>
    </feed>
EOF
    
    @jenkins.should_receive(:open).with('http://10.7.13.12:8090/rssLatest').and_return(response)
    @jenkins.status.should == :failure
  end
end