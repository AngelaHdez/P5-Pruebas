require "test/unit"
require "rack/test"
require './lib/RockPaperScissors/app.rb'


class AppTest < Test::Unit::TestCase 
	#include Rack::Test::Methods
	def setup
        @browser = Rack::Test::Session.new(Rack::MockSession.new(RockPaperScissors::App.new)) 
    end

	def app
            Rack::Builder.new do
                    #run RockPaperScissors::App.new   
                    #@browser = Rack::Test::Session.new(Rack::MockSession.new(RockPaperScissors::App.new))      
                    run @browser
            end
    end

    def inicilizar 
    	computer_throw  = 'scissors'
    end

    def test_ganador
    	@browser.get "/?choice='rock'"
    	assert @browser.last_response.body.include?("Ganaste!")
    end
    
	def test_url
	    @browser.get '/'
    	assert @browser.last_response.ok?
   	end

	def test_body
        @browser.get "/"
        assert @browser.last_response.body.include?("Rock Paper Scissors")
    end


	def test_footer
		@browser.get"/"
		assert_match "<h3>Angela Hdez</h3>", @browser.last_response.body
	end

	def test_header
		@browser.get"/"
    	assert_match "<title>RPS</title>", @browser.last_response.body
	end

	def test_boton
    	@browser.get "/?choice='scissors'"
    	assert @browser.last_response.body.include?("Juega otra vez")
    end

	def test_link_papel
    	@browser.get "/"
    	assert_match "<a href='?choice=paper' label='paper'>", @browser.last_response.body
    end
	
	def test_link_scissors
    	@browser.get "/"
    	assert_match "<a href='?choice=scissors' label='scissors'>", @browser.last_response.body
    end

    def test_link_rock
    	@browser.get "/"
    	assert_match "<a href='?choice=rock' label='rock'>", @browser.last_response.body
    end	
	def test_static_asset
	    @browser.get "/public/css/style.css"
	    assert @browser.last_response.ok?
  	end

end