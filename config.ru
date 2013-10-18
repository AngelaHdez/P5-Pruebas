require './rps.rb'

use Rack::Session::Cookie, 
      :key => 'rack.session', 
      :domain => 'example.com',
      :secret => 'some_secret',
      :expire_after => 300 #5min

ruby rps.rb
