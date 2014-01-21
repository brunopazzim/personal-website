require 'sinatra'

get '/' do
  result = rand(1..2)
  if result.eql?(1)
    erb :index
  else
    erb :index2
  end
end
