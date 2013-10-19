desc "Arrancar la aplicacion"
task :default => :server

desc "run server"
task :server do	
  sh "rackup"
end
 

#Para su uso debemos arrancar el servido en una terminal y hacer rake rock en otra
desc "run the client with rock"
task :rock do
  sh %{curl -v 'http://localhost:8080?choice=rock'}
end

desc "run the client with paper"
task :paper do
  sh %q{curl -v 'http://localhost:8080?choice=paper'}
end

desc "run the client with scissors"
task :scissors do
  sh %q{curl -v 'http://localhost:8080?choice=scissors'}
end

#acceder a una pagina estatica
desc "acces to static file"
task :index do
  sh %q{curl -v 'http://localhost:8080/public/css/style.css'}
end

#Test unitarios
desc "run the unit tests"
task :test do
  sh "ruby test/test.rb "
end

desc "run rspec test"
task :rspec do
  sh "rspec -Ilib -Itest spec/RockPaperScissors/app_spec.rb"
end
