require 'rack'
require 'rack/request'
require 'rack/response'
require 'haml'

module RockPaperScissors
  class App 

    def initialize()
      @defeat = {'rock' => 'scissors', 'paper' => 'rock', 'scissors' => 'paper'}
      @throws = ''
    end

    def set_env(env)
      @env = env
      @session = env['rack.session']
    end

    def some_key 
      return @session['some_key'].to_i if @session['some_key']
      @session['some_key'] = 0
    end

    def some_key=(value)
      @session['some_key'] = value
    end

    #Acceso al HTML para mostrar los resultados
    def haml(template, resultado)
      template_file = File.open(template, 'r')
      Haml::Engine.new(File.read(template_file)).render({},resultado)
    end

    def call(env)
      player_throw = ''
      anwser = ''
      req = Rack::Request.new(env)

      player_throw = req.GET["choice"]
      @throws = @defeat.keys
      

      if !@throws.include?(player_throw)
        do_it = "Choose one"
      else
        computer_throw = @throws.sample
      end
      puts #{player_throw}
      puts #{computer_throw}
      
      anwser= if (player_throw == computer_throw && (player_throw != '' || computer_throw!=''))
        "tied"
      elsif computer_throw == @defeat[player_throw]
        "win"
      else
        "loose"
      end

      resultado = 
        {:do_it => do_it,
        :anwser => anwser,
        :throws => @throws,
        :computer_throw => computer_throw,
        :player_throw => player_throw}
      res = Rack::Response.new(haml("views/index.html.haml", resultado))

    end # call
  end   # App
end     # RockPaperScissors