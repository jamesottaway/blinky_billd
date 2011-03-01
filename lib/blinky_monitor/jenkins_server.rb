require 'open-uri'

module BlinkyMonitor
  class JenkinsServer
    def initialize url
      @url = url
    end
    
    def status
      open("#{@url}/rssLatest").include?('(broken') ? :failure : :success
    end
  end
end