require 'sinatra'
require 'sinatra/reloader'

$randNum = rand(100)
@@tries = -1

get '/' do
  @@tries = @@tries + 1
  guess = params[:guess]
  message = check(guess)
  color = colorcheck(guess.to_i, $randNum.to_i)
  if params[:resetit] == "reset"
    resetit
  end
  erb :index, :locals => {:randNum => $randNum, :message=> message, :tries => @@tries, :color => color}
#"renders the ERB template named index and creates a local variable for the template named number which has the same value as the number variable from this server code."
end
def check(num)
  if num.nil?
    message = "Take a Guess.."
  elsif num.to_i == $randNum
    message = "You got it!!"
  elsif num.to_i < $randNum
    message = "Nope.."
    # color = "green"
  elsif num.to_i > $randNum
    message = "Nope.."
  else
    message = "Did you enter a number?"
  end
  return message
end



def colorcheck(num1, num2)
dif = (num1 - num2).abs
case dif
when 0
  color = "#00FF00"
when 1
  color = "#22ff00"
when 2
  color = "#44ff00"
when 3
color = "#66ff00"
when 4
color = "#88ff00"
when 5
color = "#AAff00"
when 6
color = "#bbff00"
when 7
color = "#ccff00"
when 8
color = "#ddff00"
when 9 .. 12
color = "#eeff00"
when 13 .. 17
color = "#FFFF00"
when 18 .. 23
color = "#FFCC00"
when 24 .. 28
color = "#ff9900"
when 29.. 34
color = "#ff6600"
when 35 .. 59
color = "#FF2200"
when 60 .. 100
color = "#FF0000"
end
return color
end


def resetit
  @@tries = 0
  $randNum = rand(100)
end
