require 'rack'
require 'rack/request'
require 'rack/response'
require 'haml'
require 'pp'

module RockPaperScissors
  class App 

    def initialize(app=nil )
      @defeat = {'rock' => 'scissors', 'paper' => 'rock', 'scissors' => 'paper'}
      @app = app
      @throws = ''
    end
    def set_env(env)
      @env = env
      @session = env['rack.session']
    end

    def gana()
      return @session['gana'].to_i if @session['gana'] 
      @session['gana'] = 0
    end

    def gana=(value)
      @session['gana'] = value
    end

    def tira
      return @session['tira'].to_i if @session['tira'] 
      @session['tira'] = 0
    end

    def tira=(value)
      @session['tira'] = value
    end

    #Acceso al HTML para mostrar los resultados
    def haml(template, resultado)
      template_file = File.open(template, 'r')
      Haml::Engine.new(File.read(template_file)).render({},resultado)
    end

    def call(env)
      set_env(env)
      player_throw = ''
      anwser = ''
      req = Rack::Request.new(env)

      player_throw = req.GET["choice"]
      @throws = @defeat.keys
      

      if !@throws.include?(player_throw)
        do_it = "Choose one"
      else
        computer_throw = @throws.sample
        ######COOKIE#########
        self.tira = self.tira + 1
      end
      puts #{player_throw}
      puts #{computer_throw}
      
      anwser=if (player_throw != nil || computer_throw!= nil)
       if (player_throw == computer_throw )
          "tied"
        elsif computer_throw == @defeat[player_throw]
          "win"  
        else
          "loose"
        end
      end

      if anwser == "win"
      ######COOKIE#########
      self.gana= self.gana() + 1
      end
      
     
      resultado = 
        {:do_it => do_it,
        :anwser => anwser,
        :throws => @throws,
        :computer_throw => computer_throw,
        :player_throw => player_throw,
        :cookie => self.gana,
        :jugar => self.tira,
      }
      res = Rack::Response.new(haml("views/index.html.haml", resultado))

    end # call
  end   # App
end     # RockPaperScissors