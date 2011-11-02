$: << File.dirname(__FILE__)+'/../lib'
$: << File.dirname(__FILE__)
$: << File.dirname(__FILE__)+'/support'

def feed_for name
	file = File.dirname(__FILE__) + '/fixtures/' + name
	File.read file
end
