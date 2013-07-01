# Kenneth Moy
# 7/1/2013

require_relative 'secret_number'
require_relative 'player'

# Plays the Secret Number Game
class Game
	attr_accessor	:secret_number, :guesses, :low_range, :high_range, :user_name, :session_number, :number_of_wins

	# Setup secret number, guesses, range of numbers to guess from, session number, number of wins
	def initialize(player)
		@guesses = 3
		@low_range = 1
		@high_range = 10
		@secret_number = Secret_Number.new(@low_range,@high_range).get_secret_number
		@user_name = player.get_user_name
		@session_number = 1
		@number_of_wins = 0
	end

	# Setup secret number and guesses for another session
	# Increase session number
	def set_up_game_session
		@guesses = 3
		@secret_number = Secret_Number.new(@low_range,@high_range).get_secret_number
		@session_number += 1 
	end

	# Informs user how many wins they have
	def win_ratio_output
		puts "#{@user_name}, #{number_of_wins > 0 ? "you have won #{@number_of_wins}" : 'you have not won'} out of #{session_number} #{session_number > 1 ? 'sessions' : 'session'}."
	end

	# Welcome Screen to Game
	def greetings
		puts
		puts "Welcome to the Secret Number Game!"
		puts "Created by Kenneth"
		puts
	end

	# Greet User and Display the Rules of the Game
	def get_rules_of_game
		puts "Hello #{@user_name}!"
		puts "Here are the rules of the game:"
		puts "You must guess a number between #{@low_range} and #{@high_range}."
		puts "You will only have #{@guesses} tries to guess the secret number."
		puts
	end

	# Infroms user if guess is higher or lower then the secret number
	def higher_lower_num(guess_num,secret_num)
		puts "#{guess_num > secret_num ? 'You guessed too high.' : 'You guessed too low.'}"
	end

	# Informs user of number of guesses left
	def num_guess_ouput(guess_num)
		puts "You have #{guess_num} #{@guesses > 1 ? 'guesses' : 'guess'} to guess the number."
	end

	# Regulates users guesses to correct conditional statement
	def check_user_guess(guesses_left, guess_number)
		puts
		if @secret_number == guess_number # Correct Guess
			puts "CONGRATULATIONS, YOU WIN!"
			puts "You guessed the correct number which was #{@secret_number}."
			puts "Game Session Over"
			@number_of_wins += 1 
			@guesses = 0 # Stop Guessing
		elsif (guess_number != @secret_number) && @guesses == 1 && (@low_range..@high_range).member?(guess_number) #Incorrect guess and last guess
			puts "You did not guess the number. The number was #{@secret_number}."
			puts "YOU LOSE. GAME SESSION OVER"
			@guesses = 0 # Stop Guessing
		elsif guess_number != @secret_number && (@low_range..@high_range).member?(guess_number) # Incorrect guess and more guesses available
			puts "You did not guess the number."
			@guesses = guesses_left - 1 
			higher_lower_num(guess_number,@secret_number)
			num_guess_ouput(@guesses)
		else # Incorrect input
			puts "Wrong Input."
			puts "Enter a number between 1 and 10."
		end
	end

	# Start Game Session
	def start_session
		greetings
		get_rules_of_game
		puts "Session #{session_number} Starts Now!"
		while @guesses > 0 # Loop until no more guesses
			puts "What number will you guess(#{@low_range}-#{@high_range})? "
			guess_num = gets.to_i
			check_user_guess(@guesses, guess_num)
		end
	end
end