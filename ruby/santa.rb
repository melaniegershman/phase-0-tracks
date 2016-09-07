class Santa
	# refactor getter method:
	attr_reader :age, :ethnicity
	# refactor setter method:
	attr_accessor :gender

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
		puts "Santa is #{@gender}."
	end

	# setter methods - longhand:
	def celebrate_birthday
		@age += 1
		puts "Santa is now #{@age} years old."
	end

	def get_mad_at(scolded_reindeer)
		@reindeer_ranking[@reindeer_ranking.index(scolded_reindeer)], @reindeer_ranking[-1] = @reindeer_ranking[-1], @reindeer_ranking[@reindeer_ranking.index(scolded_reindeer)]
		puts "If Santa is mad at #{scolded_reindeer}, it's back to the end of the line with #{scolded_reindeer}!"
		@reindeer_ranking.each_with_index {|reindeer, index| puts "#{index + 1}: #{reindeer}"}
	end

	# def gender=(new_gender)
	# 	@gender = new_gender
	# end

	# getter methods - longhand:
	# def age
	# 	@age
	# end

	# def ethnicity
	# 	@ethnicity
	# end
end
# Empty array to collect the diverse santas
santas = []

# Push each individual santa into the santa array
# santas << Santa.new("agender", "black")
# santas << Santa.new("female", "Latino")
# santas << Santa.new("bigender", "white")
# santas << Santa.new("male", "Japanese")
# santas << Santa.new("female", "prefer not to say")
# santas << Santa.new("gender fluid", "Mystical Creature (unicorn)")
# santas << Santa.new("N/A", "N/A")

# Gender and ethnicity arrays
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
# Add some more attributes
example_ethnicities << "Jewish"
example_genders << "transgender"
#Initialize many diverse santas (iterate over the gender and ethnicity arrays)
example_genders.length.times do |i|
	puts "Creating a #{example_genders[i]} Santa..."
  santas << Santa.new(example_genders[i], example_ethnicities[i])
  puts "There are now #{santas.length} Santa instances in this array."
end

# Tell santas what to do
santas.each do |santa| 
	santa.speak
	santa.eat_milk_and_cookies("Snickerdoodle")
	santa.celebrate_birthday
end

# Santa gets mad at a reindeer
st_nick = Santa.new("female", "Russian")
st_nick.get_mad_at("Vixen")

# Change santa's gender
elf = Santa.new("male", "Chinese")
puts "The elf is #{elf.gender}."
elf.gender = "female"
puts "The elf is now #{elf.gender}!"

# Get santa's age and ethnicity:
santa_new2 = Santa.new("male", "French")
puts "Santa is #{santa_new2.age} years old and #{santa_new2.ethnicity}"