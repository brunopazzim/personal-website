require 'rubygems'
require 'sinatra/base'
require 'slim'
require 'sass'
require 'coffee-script'

class SassHandler < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/templates/sass'
  get '/css/*.css' do
    filename = params[:splat].first
    scss filename.to_sym
  end
end

class CoffeeHandler < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/templates/coffee'
  get "/js/*.js" do
    filename = params[:splat].first
    coffee filename.to_sym
  end
end

class MyApp < Sinatra::Base
  use SassHandler
  use CoffeeHandler
  set :public, File.dirname(__FILE__) + '/public'
  set :views, File.dirname(__FILE__) + '/templates'
  get '/' do
    slim :index
  end
end

if __FILE__ == $0
  MyApp.run! :port => 4567
end

#get '/' do
#  result = rand(1..2)
#  if result.eql?(1)
#    erb :index
#  else
#    erb :index2
#  end
#end
