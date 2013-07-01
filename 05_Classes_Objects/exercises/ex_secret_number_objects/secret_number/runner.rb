# Kenneth Moy
# 7/1/2013
# Back-End Web Development - HW #2 Secret Number Game Updated

require_relative '../secret_number/lib/player'
require_relative '../secret_number/lib/game'

# Checks for bad input (Only accepts 'y' or 'n')
def check_yes_no_input(input)
	while input != 'y' && input != 'n'
		puts "Wrong Input! Please type 'y' to continue to game or 'n' to quit"
		input = gets.strip.downcase
	end
	input
end

# Play Game and ask to play another session
def play_game(player)
	game = Game.new(player)
	play_again = 'y'
	while play_again == 'y'
		game.start_session
		game.win_ratio_output
		puts
		puts "Do you want to play another session? (Type 'y'/'n')"
		play_again = gets.strip.downcase
		check_yes_no_input(play_again)
		game.set_up_game_session
	end
end

# Greet and ask player if they want to play a game
puts "Greetings Player!"
puts "Do you want to play a game? (Type 'y'/'n')"
user_input = gets.strip.downcase
user_input = check_yes_no_input(user_input)

# Get user name and start game if requested
if user_input =='y'
	# Get user name
	puts "What is your name? "
	user_name = gets.strip
	player = Player.new(user_name)
	play_game(player) # Start Game
end

# Farewell notice
puts "#{player.nil? ? 'Goodbye!' : "Goodbye, #{player.get_user_name}. Thank You for Playing!"}"
