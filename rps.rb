require './lib/RockPaperScissors/app.rb'


builder = Rack:: Builder.new do
  use Rack::Static, :urls => ['/public']
  use Rack::ShowExceptions
  use Rack::Lint
  use Rack::Session::Cookie, 
      :key => 'rack.session', 
      :domain => 'example.com',
      :secret => 'some_secret',
      :expire_after => 30
  run RockPaperScissors::App.new

end

#Rack::Handler::Thin.run builder
use Rack::Server.start(
  	:app=> builder,
  	:Port=>9393,
  	:server=>'thin',
  	:host => 'www.example.com')