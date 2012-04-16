require 'blinky'
require 'billd/status'

module BlinkyBilld
	class Controller
		def self.run args
			uri = args.shift
			blinky = Blinky.new
			billd_status = Billd::Status.new(uri)
			blinky.light.send(billd_status.overall)
		end
	end
end