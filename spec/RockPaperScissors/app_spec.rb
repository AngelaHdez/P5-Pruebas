require 'spec_helper'

describe RockPaperScissors::App do
	#let(:app) {Rack::MockRequest.new(RockPaperScissors::App.new)}
	def app
    	Rack::MockRequest.new(RockPaperScissors::App.new) 
  	end

	context "/" do
		it "debe devolver el codigo 200 success" do
			app.get('/').status.should == 200
		end

		it "debe mostrar RPS" do
			app.get('/').header == 'RPS'
		end
	end	

	context "/?choice='scissors'" do 
		it "debe devolver el codigo 200" do
			app.get("/?choice='scissors'").status.should == 200
		end

		it "debe mostrar tijeras" do 
			app.get("/?choice='scissors'").body.include?("http://banot.etsii.ull.es/alu4079/STYW/rps/tijeras.png")
		end
	end

	context "/?choice='rock'" do 
		it "debe devolver el codigo 200" do
			app.get("/?choice='rock'").status.should == 200
		end

		it "debe mostrar roca" do 
			app.get("/?choice='rock'").body.include?("http://banot.etsii.ull.es/alu4079/STYW/rps/piedra.png")
		end
	end

	context "/?choice='paper'" do 
		it "debe devolver el codigo 200" do
			app.get("/?choice='paper'").status.should == 200
		end

		it "debe mostrar papel" do 
			app.get("/?choice='paper'").body.include?("http://banot.etsii.ull.es/alu4079/STYW/rps/papel.png")
		end
	end
end