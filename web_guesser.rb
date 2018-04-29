require 'sinatra'
require 'sinatra/reloader'

randNum = rand(100)
get '/' do
  erb :index, :locals => {:randNum => randNum}
#"renders the ERB template named index and creates a local variable for the template named number which has the same value as the number variable from this server code."
end
