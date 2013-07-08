# Kenneth Moy
# 7/5/2013
# Back-End Web Development - Midterm API Project


require_relative '../midterm_kenneth/lib/api_view_nytimes'
require_relative '../midterm_kenneth/lib/api_handler_nytimes'

view = API_View_NYTimes.new
api_handler = API_Handler_NYTimes.new

view.show_Intro

view_articles = true
# Loop while user still wants to view articles
while view_articles
	view.select_Most_Popular_Option
	view.select_Article_Section
	view.select_Duration_Option

	api_handler.get_from_nytimes(view.format_url_string)
	api_handler.show_all_articles

	puts "\nDo you want to view more articles?(Type 'y'/'n')"
	input = gets.strip
	while input != 'y' && input != 'n'
		"Error, Wrong Input!\nPlease type 'y' to continue or 'n' to quit"
		input = gets.strip
	end
	if  input == 'n'
		view_articles = false
	end
end

view.show_Farewell
