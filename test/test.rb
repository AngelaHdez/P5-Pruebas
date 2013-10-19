require "test/unit"
require "rack/test"
require './lib/RockPaperScissors/app.rb'


class AppTest < Test::Unit::TestCase 
	include Rack::Test::Methods
	
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
		assert last_response.footer.include?("Angela Hdez")	
	end

	def test_header
		get"/"
		assert last_response.header.include?("RPS")	
	end

    #def cookie
	#	get "/"	
	#	assert expired?
	#end
end