require 'spec_helper'
require 'blinky_billd/controller'

describe BlinkyBilld::Controller do
	let(:blinky) { mock 'Blinky' }
	let(:light) { mock 'Light' }
	let(:billd_status) { mock 'Billd::Status' }
	let(:uri) { '//build/status' }

	before { Blinky.should_receive(:new).and_return(blinky) }
	before { Billd::Status.should_receive(:new).with(uri).and_return(billd_status) }
	before { billd_status.should_receive(:overall).and_return(:success_or_failure) }
	before { blinky.should_receive(:light).and_return(light) }
	before { light.should_receive(:success_or_failure) }

	it { BlinkyBilld::Controller.run(uri) }
end