class Santa
	def initialize(gender, ethnicity)
		# puts "Initializing Santa instance..."
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

	def celebrate_birthday
		@age += 1
		puts "Santa is now #{@age} years old."
	end

	def get_mad_at(scolded_reindeer)
		@reindeer_ranking[@reindeer_ranking.index(scolded_reindeer)], @reindeer_ranking[-1] = @reindeer_ranking[-1], @reindeer_ranking[@reindeer_ranking.index(scolded_reindeer)]
		puts "If Santa is mad at #{scolded_reindeer}, it's back to the end of the line with #{scolded_reindeer}!"
		@reindeer_ranking.each_with_index {|reindeer, index| puts "#{index + 1}: #{reindeer}"}
	end
end

santas = []
# santas << Santa.new("agender", "black")
# santas << Santa.new("female", "Latino")
# santas << Santa.new("bigender", "white")
# santas << Santa.new("male", "Japanese")
# santas << Santa.new("female", "prefer not to say")
# santas << Santa.new("gender fluid", "Mystical Creature (unicorn)")
# santas << Santa.new("N/A", "N/A")

example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
# Add some more attributes
example_ethnicities << "Jewish"
example_genders << "transgender"
#Initialize many diverse santas (iterate over the gender and ethnicity arrays)
example_genders.length.times do |i|
  santas << Santa.new(example_genders[i], example_ethnicities[i])
end
# Tell santas what to do
santas.each do |santa| 
	santa.speak
	santa.eat_milk_and_cookies("Snickerdoodle")
	santa.attributes
	santa.celebrate_birthday
	santa.get_mad_at("Vixen")

end
