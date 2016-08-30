# Write a program that will allow an interior designer to enter the details
# of a given client: the client's name, age, number of children, decor theme
# and more. 

# Convert any user input to the appropriate data type.

# Give the user the opportunity to update a key (no need to loop, once is fine). 
# After all, sometimes users make mistakes! If the designer says "none", skip it. 
# But if the designer enters "decor_theme" (for example), your program should ask 
# for a new value and update the :decor_theme key. (Hint: Strings have methods that 
# will turn them into symbols, which would be quite handy here.) You can assume the 
# user will correctly input a key that exists in your hash -- no need to handle user 
# errors.
# Print the latest version of the hash, and exit the program.
# Helper methods to use in final program
def name
	puts "What is your client's full name?"
	name = gets.chomp
end

def age
	puts "What is your client's age?"
	age = gets.chomp.to_i
end

def children
	puts "How many children does your client have?"
	children = gets.chomp.to_i
end

def decor
	puts "What is your client's preferred decor style?"
	decor = gets.chomp
end

def color
	puts "What is your client's favorite color?"
	color = gets.chomp
end
# Prompt the designer/user for all of this information (define a method).
def client_form
	client_pref = {
		name: "",
		age: '',
		children: '',
		decor: "",
	}
	puts "Hello, welcome to Interior Solutions. Please help us help you by answering the following questions."
	client_pref[:name] = name
	client_pref[:age] = age
	client_pref[:children] = children
	client_pref[:decor] = decor
	client_pref[:color] = color
	# Print the hash back out to the screen.
	puts "Here is a summary of your client's information: #{client_pref}."
end


client_form
