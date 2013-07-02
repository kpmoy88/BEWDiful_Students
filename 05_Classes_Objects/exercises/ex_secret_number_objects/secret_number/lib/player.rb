# Kenneth Moy
# 7/1/2013

# Stores user name
class Player
	attr_accessor :user_name

	def initialize(name)
		@user_name = name
	end

	def get_user_name
		"#{@user_name}"
	end
end