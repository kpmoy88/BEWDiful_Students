# Kenneth Moy
# 7/5/2013

require_relative  'api_handler'

# Handles url requests for NY Times API
class API_Handler_NYTimes <  API_Handler

	# Get all articles based on url request
	def get_from_nytimes(formatted_url)
		response = RestClient.get(formatted_url)
		parsed_response = JSON.load(response)
		parsed_response["results"].map do |article|
			article = { title: article["title"], section: article["section"], column: article["column"], 
					  date: article["published_date"], description: article["abstract"], url: article["url"] }
     		@articles << article # Add hash to array
     	end
	end

	# Display all articles in array in a specific format
	def show_all_articles
		if @articles.size > 0
  			@articles.each do |article|
    			show_article_piece("\nArticle Title: #{article[:title]}\nSection: #{article[:section]}\nColumn: #{article[:column]}")
 				show_article_piece("Published: #{article[:date]}\nDescription: #{article[:description]}\nLink: #{article[:url]}")
 			end
 			puts "\nTotal Articles Available: #{@articles.size}"
 		else # No articles to display
 			puts "\nSorry, There are no articles available with the options that were selected."
 		end
 	end
end
