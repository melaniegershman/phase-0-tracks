def hamster_intake
	puts "What is the hamster's name?"
	name = gets.chomp
	puts "How loud is your hamster? (from a scale of 1-10)"
	volume = gets.chomp.to_i
	puts "What color is your hamster's fur?"
	fur = gets.chomp
	puts "Is your hamster a good candidate for adoption? (yes/no)"
	eligibility = gets.chomp
	puts "Estimated age?"
		age = gets.chomp
		if age.empty? #if age == "" is another alternative
			age = nil
		else 
			age.to_i
		end
	p "Welcome to Hamster Sanctuary! Thank you for bringing in #{name}. It's squeak level is #{volume} and it's color is #{fur}. It's age is #{age} years old. Do we think this is a good candidate for adoption? #{eligibility.capitalize}!"
end

hamster_intake