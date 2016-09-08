# Sept 7 --- Lesson 6.4: Modules

# RELEASE 1: Write a Simple Module

# Declare a module:
# module Shout
# 	def self.yell_angrily(words)
# 		words + "!!! :("
# 	end
# 	# Add a yelling happily method
# 	def self.yelling_happily(words)
# 		words + "!!! :D"
# 	end
# end

# RELEASE 3: Convert a Standalone Module to a Mixin
module Shout
	def yelling_angrily(words)
		words.upcase + "!!! >:o"
	end

	def yelling_happily(words)
		words.upcase + "!!! :D"
	end
end

class Rooster
	include Shout
end

class PrDirector
	include Shout
end

rooster = Rooster.new
puts rooster.yelling_happily("Cockadoodledoo")

pr_director = PrDirector.new
puts pr_director.yelling_angrily("the internet is broken")

# Driver code to test Shout module (from release 1)
# puts Shout.yell_angrily("you peddled backwards, now you ruined the ride")
# puts Shout.yelling_happily("way to go")
