require 'open-uri'

module BlinkyMonitor
  class CruiseControlServer
    def initialize url
      @url = url
    end
    
    def status
      xml = open("#{@url}/cc.xml")
      status = :success if xml.include? 'lastBuildStatus="Success"'
      status = :failure if xml.include? 'lastBuildStatus="Failure"'
      status = :building if xml.include? 'activity="Building"'
      status
    end
  end
end