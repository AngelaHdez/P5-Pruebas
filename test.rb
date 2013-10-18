require "test/unit"
require "rack/test"
require './lib/RockPaperScissors/app.rb'


class AppTest < Test::Unit::TestCase 
	include Rack::Test::Methods

	def app
		Rack::Builder.new do
			run RockPaperScissors::App.new
		end.to_app
	end
	def test_index
	    get "/"
	    assert last_response.ok?
	end
	

end