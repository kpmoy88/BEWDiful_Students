# Kenneth Moy
# 7/5/2013

require_relative  'api_view'

# Displays options for user to decide and sends url request to API Handler
class API_View_NYTimes < API_View

	# Options available to user
	MOST_POPULAR_OPTION = { 1 => "Most Viewed", 2 => "Most Shared", 3 => "Most Emailed" }
	ARTICLE_SECTIONS = { 1 => "All", 2 => "World", 3 => "National", 4 => "New York", 5 => "Business", 6 => "Technology",
						 7 => "Health", 8 => "Sports", 9 => "Opinion", 10 => "Arts", 11 => "Style", 12 => "Travel"}
	DURATION = { 1 => "One Day", 2 => "Week", 3 => "Month" }
	
	# API Key needed for NY Times url request
	NYTIMES_API_KEY = "?api-key=80fd1d354d3d66045bbbbdd3067ca076:0:67847759"

	# Amount of options available when displaying options to user
	MOST_POPULAR_SIZE = MOST_POPULAR_OPTION.size
	ARTICLE_SECTIONS_SIZE = ARTICLE_SECTIONS.size
	DURATION_SIZE = DURATION.size

	INPUT_ERROR_MESSAGE = "Error, Wrong Input!\nPlease type the number: "

	attr_accessor	:most_option, :section_option, :duration_option

	# Welcome Screen to Application
	def show_Intro
		show_message("Welcome to NY Pop! a text based news aggregator.\nGet NY Times Most Popular Articles")
	end

	# Farewell Message to User
	def show_Farewell
		show_message("Goodbye! Thank You for using NY Pop!")
	end

	# Displays the users options of viewing popular artciles based on Views, Shared or Emailed
	def select_Most_Popular_Option
		show_message("Check Out the Popular Articles Based On:")
		display_MP_Option
		show_message("Type 1-#{MOST_POPULAR_SIZE} to view your option.")
		most_user_input = gets.strip.to_i
		# Assigns most popular option for making url
		@most_option = get_Most_Popular_String(check_MP_Option(most_user_input))
	end

	# Displays options of viewing Most Popular articles
	def display_MP_Option
		MOST_POPULAR_OPTION.each do |number, option|
			show_message("#{number}. #{option}")
		end
	end

	# Checks if user input is correct for Most Popular Option
	def check_MP_Option(user_input)
		until MOST_POPULAR_OPTION.include?(user_input)
			show_message(INPUT_ERROR_MESSAGE)
			display_MP_Option
			user_input = gets.strip.to_i
		end
		user_input
	end

	# Get string needed for url of user's input of Most Popular option
	def get_Most_Popular_String(num_input)
		MOST_POPULAR_OPTION[num_input].downcase.delete(" ")
	end

	# Displays the users options of what article section they want to view
	def select_Article_Section
		puts "What Section Would You Like To View:"
		display_Section_Option
		show_message("Type 1-#{ARTICLE_SECTIONS_SIZE} to view your option.")
		section_user_input = gets.strip.to_i
		# Assigns article section option for making url
		@section_option = get_Section_String(check_Section_Option(section_user_input))
	end

	# Displays options of what sections the articles come from
	def display_Section_Option
		ARTICLE_SECTIONS.each do |number, option|
			show_message("#{number}. #{option}")
		end
	end

	# Checks if user input is correct
	def check_Section_Option(user_input)
		until ARTICLE_SECTIONS.include?(user_input)
			show_message(INPUT_ERROR_MESSAGE)
			display_Section_Option
			user_input = gets.strip.to_i
		end
		user_input
	end

	# Change user's input to string article sections for url
	def get_Section_String(num_input)
		if num_input == 1
			"all-sections"
		elsif num_input == 4
			"nyregion"
		else
			ARTICLE_SECTIONS[num_input].downcase
		end
	end

	# Displays the users options on popular articles for a length of time
	def select_Duration_Option
		puts "What Duration Would You Like To View:"
		display_Duration_Option
		show_message("Type 1-#{DURATION_SIZE} to view your option.")
		duration_user_input = gets.strip.to_i
		# Assigns duration option for making url
		@duration_option = get_Duration_String(check_Duration_Option(duration_user_input))
	end

	# Displays options of what durations the user can choose from
	def display_Duration_Option
		DURATION.each do |number, option|
			show_message("#{number}. #{option}")
		end
	end

	# Checks if user input is correct
	def check_Duration_Option(user_input)
		unless DURATION.include?(user_input)
			show_message(INPUT_ERROR_MESSAGE)
			display_Duration_Option
			user_input = gets.strip.to_i
		end
		user_input
	end

	# Change user's input to string time duration for url
	def get_Duration_String(num_input)
		case num_input
			when 1 then "1"
			when 2 then "7"
			when 3 then "30"
		end
	end

	# URL to submit to get articles
	def format_url_string
		"http://api.nytimes.com/svc/mostpopular/v2/#{@most_option}/#{@section_option}/#{duration_option}#{NYTIMES_API_KEY}"
	end
end