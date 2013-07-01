# Kenneth Moy
# 7/1/2013

# Generate a random number from a set range
class Secret_Number
	attr_accessor	:secret_number_list

	# Takes in low and high numbers to set range of numbers to select from
	# Adds numbers to an array
	def initialize(low_range, high_range)
		@secret_number_list = []
		until low_range > high_range 
			@secret_number_list << low_range
			low_range += 1
		end
	end

	# Randomly selects number from the array
	def get_secret_number
		@secret_number_list.sample
	end
end
