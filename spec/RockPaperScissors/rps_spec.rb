require 'spec_helper'

describe RockPaperScissors::App do
	
	let(:app) {Rack::MockRequest.new(RockPaperScissors::App.new)}
	#def server
    #	Rack::MockRequest.new(Rsack::Server.new) 
  	#end
	context "/" do
		it "debe devolver el codigo 200 success" do
			app.get('/').status.should == 200
		end
	end	
end