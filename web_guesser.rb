require 'sinatra'
require 'sinatra/reloader'

secretNum = rand(100)
get '/' do
  "The secret number is #{secretNum}"
end
