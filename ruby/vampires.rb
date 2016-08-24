puts "How many employees will be processed?"
employees = gets.chomp.to_i
def vampire_interview(employees)
	employees == i 
	until employees == 0 do
		puts "What is your name?"
		name = gets.chomp
		puts "How old are you? What year were you born?"
		year = gets.chomp
		age = gets.chomp
		puts "Our company cafeteria serves garlic bread. Should we order some for you?"
		garlic = gets.chomp
		puts "Would you like to enroll in the company’s health insurance?"
		insurance = gets.chomp

		if (2016 - year == age) && (garlic == "yes" || insurance == "yes")
			p "Probably not a vampire."
		elsif (2016 - year !== age) && (garlic == "no" || insurance == "no")
			p "Probable a vampie."
		elsif (2016 - year !== age) && (garlic == "no" && insurance == "no")
			p "Almost certainly a vampire."
		elsif name == "Drake Cula" || name == "Tu Fang"
			p "Definitely a vampire."
		else
			p "Results inconclusive."
		end
		i -= 1
	end
end