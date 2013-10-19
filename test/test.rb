require "test/unit"
require "rack/test"
require './lib/RockPaperScissors/app.rb'


class AppTest < Test::Unit::TestCase 
	include Rack::Test::Methods
	attr_reader :gana
	attr_reader :tira
	
	def app
            Rack::Builder.new do
                    run RockPaperScissors::App.new        
            end
    end

	def test_url
	    browser = Rack::Test::Session.new(Rack::MockSession.new(RockPaperScissors::App.new))
    	browser.get '/'
    	assert browser.last_response.ok?
	end

	def test_body
        get "/"
        assert last_response.body.include?("Rock Paper Scissors")
    end


	def test_footer
		get"/"
		assert_match "<h2>Angela Hdez</h2>", last_response.body
	end

	def test_header
		get"/"
    	assert_match "<title>RPS</title>", last_response.body
	end

	def test_static_asset
	    get "/public/css/style.css"
	    assert last_response.ok?
  	end

end