require 'sinatra'
require 'sinatra/reloader'

RANDNUM = rand(100)
@@tries = -1
get '/' do
  @@tries = @@tries + 1
  guess = params[:guess]
  message = check(guess)
  if params[:resetit] == "reset"
    resetit
  end
  erb :index, :locals => {:randNum => RANDNUM, :message=> message, :tries => @@tries}
#"renders the ERB template named index and creates a local variable for the template named number which has the same value as the number variable from this server code."
end
def check(num)
  if num.to_i == RANDNUM
    message = "You got it!!"
  elsif num.to_i < RANDNUM
    message = "Too low!"
  elsif num.to_i > RANDNUM
    message = "Too high!"
  else
    message = "Did you enter a number?"
  end
  return message
end

def resetit
  @@tries = 0
end
