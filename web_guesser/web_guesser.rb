require 'sinatra'
require 'sinatra/reloader'

$random_number = rand(100)

get '/' do	
	guess = params['guess']
	message = check_guess(guess)
	erb :index, :locals => {:random_number => $random_number, :message => message}
end

def check_guess(guess)
	case 
	when guess.to_i > $random_number + 5
		"Way too high!"
	when guess.to_i > $random_number
		"Too high!"
	when guess.to_i < $random_number - 5
		"Way too low!"
	when guess.to_i < $random_number
		"Too low!"
	else
		$random_number = rand(100)
		"You got it right! Try again"
	end
end