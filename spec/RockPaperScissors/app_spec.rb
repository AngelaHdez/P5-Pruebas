require 'spec_helper'
require 'pp'

describe RockPaperScissors::App do
	#let(:app) {Rack::MockRequest.new(RockPaperScissors::App.new)}
	def app
        Rack::MockRequest.new(Rack::Session::Cookie.new(RockPaperScissors::App.new, 
        	:secret =>'cookie')) 

  	end

	context "/" do
		it "debe devolver el codigo 200 success" do
			res =app.get('/')
			res.status.should == 200
			#pp app
			
		end

		it "debe mostrar RPS" do
			app.get('/').header == 'RPS'
		end
	end	

	context "/?choice='scissors'" do 
		it "debe devolver el codigo 200" do
			#puts "**************************#{rack_mock_session.cookie_jar.inspect}" 
			app.get("/?choice='scissors'").status.should == 200

		end

		it "debe mostrar tijeras" do 
			app.get("/?choice='scissors'").body.include?("http://banot.etsii.ull.es/alu4079/STYW/rps/tijeras.png")
		end

		it "debe ganar" do
			computer_throw='paper'
			app.get("/?choice='scissors'").body.include?("Ganaste!")
		end

		it "debe perder" do
			computer_throw='rock'
			app.get("/?choice='scissors'").body.include?("Perdiste!")
		end

		it "empate" do
			computer_throw = 'scissors'
			app.get("/?choice='scissors'").body.include?("Empate!")
		end
	end

	context "/?choice='rock'" do 
		it "debe devolver el codigo 200" do
			app.get("/?choice='rock'").status.should == 200
		end

		it "debe mostrar roca" do 
			app.get("/?choice='rock'").body.include?("http://banot.etsii.ull.es/alu4079/STYW/rps/piedra.png")
		end

		it "debe ganar" do
			computer_throw='scissors'
			app.get("/?choice='rock'").body.include?("Ganaste!")
		end

		it "debe perder" do
			computer_throw='paper'
			app.get("/?choice='rock'").body.include?("Perdiste!")
		end

		it "empate" do
			computer_throw = 'rock'
			app.get("/?choice='rock'").body.include?("Empate!")
		end
	end

	context "/?choice='paper'" do 
		it "debe devolver el codigo 200" do
			app.get("/?choice='paper'").status.should == 200
		end

		it "debe mostrar papel" do 
			app.get("/?choice='paper'").body.include?("http://banot.etsii.ull.es/alu4079/STYW/rps/papel.png")
		end

		it "debe ganar" do
			computer_throw='rock'
			app.get("/?choice='paper'").body.include?("Ganaste!")
		end

		it "debe perder" do
			computer_throw='scissors'
			app.get("/?choice='paper'").body.include?("Perdiste!")
		end

		it "empate" do
			computer_throw = 'paper'
			app.get("/?choice='paper'").body.include?("Empate!")
		end
	end

	##cookie
end
