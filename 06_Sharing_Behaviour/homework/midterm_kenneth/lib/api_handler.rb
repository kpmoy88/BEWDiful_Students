# Kenneth Moy
# 7/5/2013

require 'json'
require 'rest-client'

# Base class to get articles based on url request
class API_Handler

	attr_accessor :articles

	def initialize()
		@articles = []
	end

	# Display article parts to user
	def show_article_piece(piece)
    	puts piece
	end

end
