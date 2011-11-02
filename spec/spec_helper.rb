$: << File.dirname(__FILE__)+'/../lib'
$: << File.dirname(__FILE__)

require 'blinky'
require 'hipster_server'

def feed_for name
	file = File.dirname(__FILE__) + '/fixtures/' + name
	File.read file
end
