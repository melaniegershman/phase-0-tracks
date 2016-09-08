# Sept 7 --- Lesson 6.4: Modules

# RELEASE 1: Write a Simple Module

# Declare a module:
module Shout
	def self.yell_angrily(words)
		words + "!!! :("
	end
	# Add a yelling happily method
	def self.yelling_happily(words)
		words + "!!! :D"
	end
end
# Driver code to test Shout module
puts Shout.yell_angrily("you peddled backwards, now you ruined the ride")

puts Shout.yelling_happily("way to go")
