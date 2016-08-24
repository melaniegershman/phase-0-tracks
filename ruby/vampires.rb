puts "How many employees will be processed?"
employees = gets.chomp.to_i
def vampire_interview(employees)
	i = employees
	until i == 0 do
		puts "What is your name?"
		name = gets.chomp
		puts "How old are you? What year were you born?"
		age = gets.chomp.to_i
		year = gets.chomp.to_i
		puts "Our company cafeteria serves garlic bread. Should we order some for you?"
		garlic = gets.chomp
		puts "Would you like to enroll in the company’s health insurance?"
		insurance = gets.chomp
		
		puts "Please list your allergies one at a time. Type 'done' when you are finished."
		allergies = gets.chomp.downcase
		until allergies == "done"
			puts "Thank you. Please list your allergies one at a time. Type 'done' when you are finished."
				allergies = gets.chomp.downcase
			if allergies == "sunshine" # ----->>> something is going on here where sunshine isnt registering the first time its typed!!!!
				break
			end
		end
		
		if allergies == "sunshine"
			puts "Probably a vampire."
		elsif name == "Drake Cula" || name == "Tu Fang"
			p "Definitely a vampire."
		elsif (2016 - year != age) && (garlic == "no" && insurance == "no")
			p "Almost certainly a vampire."
		elsif (2016 - year != age) && (garlic == "no" || insurance == "no")
			p "Probably a vampire."
		elsif (2016 - year = age) && (garlic == "yes" || insurance == "yes")
			p "Probably not a vampire."
		else
			p "Results inconclusive."
		end
		i -= 1
	end
end

vampire_interview(employees)