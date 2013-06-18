#!/usr/bin/env ruby

# Kenneth Moy
# 6/18/2013
# Back-End Web Development - HW #1 Secret Number Game

# Intro and Welcome Screen
puts "Greetings Player!"
puts "Welcome to the Secret Number"
puts "Created by Kenneth Moy"

# Personally greet user
print "what is your name? "
user_name = gets.chomp
puts "Hi #{user_name}!"

# Rules of the Game
puts "Here are the rules of the game:"
puts "Guess a number between 1 and 10."
puts "You only have 3 tries to guess the correct number."

puts "Game Starts Now!"

# Random number generator
def rand_num(low,high)
	rand(low..high)
end

# Generate random number between 1 and 10
secret_number = rand_num(1,10)

# Set number of guesses
guesses = 3

# Determine if guess is higher or lower then the secret number
def higher_lower_num(guess_num,secret_num)
	if(guess_num > secret_num)
		puts "You guessed too high."
	else
		puts "You guessed too low."
	end
end

# Determine which guess output to inform user
def num_guess_ouput(guess_num)
	if guess_num > 1
		puts "You have #{guess_num} guesses to guess the number."
	else
		puts "You have #{guess_num} guess to guess the number."
	end
end

# Regulates users guesses to correct conditional statement
while guesses > 0 # Loop until no more guesses
	print "What number will you guess(1-10)? "
	guess_number = gets.to_i
	if secret_number == guess_number # Correct Guess
		puts "Congratulations, You win!"
		puts "You guessed the correct number which was #{secret_number}."
		puts "Game Session Over"
		guesses = 0
	elsif (guess_number != secret_number) && guesses == 1 && (1..10).member?(guess_number) #Incorrect guess and last guess
		puts "You did not guess the number. The number was #{secret_number}."
		puts "YOU LOSE. GAME SESSION OVER"
		guesses = 0
	elsif guess_number != secret_number && (1..10).member?(guess_number) # Incorrect guess and more guesses available
		puts "You did not guess the number."
		guesses -= 1
		higher_lower_num(guess_number,secret_number)
		num_guess_ouput(guesses)
	else # Incorrect input
		puts "Wrong Input."
		puts "Enter a number between 1 and 10."
	end
end