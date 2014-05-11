require 'sinatra'
require 'slim'
require 'sass'
require 'coffee-script'
require 'pry'

class SassHandler < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/templates/sass'
  get '/css/*.css' do
    binding.pry
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
  set :public_dir, File.dirname(__FILE__) + '/public'
  set :views, File.dirname(__FILE__) + '/templates'
  get '/' do
    slim :index
  end
end

if __FILE__ == $0
  MyApp.run! :port => 4567
end
