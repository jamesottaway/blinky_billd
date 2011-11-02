module BlinkyMonitor
  class Monitor
    def initialize ci_server, blinky
      @ci_server = ci_server
      @blinky = blinky
    end
    
    def run
      @blinky.light.send "#{@ci_server.status}!"
    end
  end
end