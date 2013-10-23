require "test/unit"
require "rack/test"
require './lib/RockPaperScissors/app.rb'
require "pp"

class AppTest < Test::Unit::TestCase 
	include Rack::Test::Methods
	#def setup

#        @browser = Rack::Test::Session.new(Rack::MockRequest.new(RockPaperScissors::App.new))
 #   end

	def app
        
        Rack::Session::Cookie.new(RockPaperScissors::App.new, 
                                :secret =>'cookie')
 
    end

    def inicilizar 
    	computer_throw  = 'scissors'
    end

    def test_ganador
    	get "/?choice='rock'"
    	assert last_response.body.include?("Ganaste!")
    end
    
	def test_url
	    get '/'
    	assert last_response.ok?
   	end

	def test_body
        get "/"
        assert last_response.body.include?("Rock Paper Scissors")
    end


	def test_footer
		get"/"
		assert_match "<h3>Angela Hdez</h3>", last_response.body
	end

	def test_header
		get"/"
    	assert_match "<title>RPS</title>", last_response.body
	end

	def test_boton
    	 get "/?choice='scissors'"
    	assert  last_response.body.include?("Juega otra vez")
    end

	def test_link_papel
    	 get "/"
    	assert_match "<a href='?choice=paper' label='paper'>",  last_response.body
    end
	
	def test_link_scissors
    	 get "/"
    	assert_match "<a href='?choice=scissors' label='scissors'>",  last_response.body
    end

    def test_link_rock
    	 get "/"
    	assert_match "<a href='?choice=rock' label='rock'>",  last_response.body
    end	
	def test_static_asset
	     get "/public/css/style.css"
	    assert  last_response.ok?
  	end

    def test_cookie
       pp current_session
        assert current_session.rack_mock_session.app.key=="rack.session"
    end

end