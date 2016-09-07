class Santa
	def initialize(gender, ethnicity)
		puts "Initializing Santa instance..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end

	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie)
		puts "That was a good #{cookie}!"
	end

	def attributes
		puts "Santa is #{@gender} and #{@ethnicity}"
		puts "Santa is #{@age} years old."
		puts "Santa prefers his reindeer in the following order:"
		@reindeer_ranking.each_with_index {|reindeer, index| puts "#{index + 1}: #{reindeer}"}
	end

end
santas = []
santas << Santa.new("agender", "black")
santas << Santa.new("female", "Latino")
santas << Santa.new("bigender", "white")
santas << Santa.new("male", "Japanese")
santas << Santa.new("female", "prefer not to say")
santas << Santa.new("gender fluid", "Mystical Creature (unicorn)")
santas << Santa.new("N/A", "N/A")

santas.each do |santa| 
	santa.speak
	santa.eat_milk_and_cookies("Snickerdoodle")
	santa.attributes
end
