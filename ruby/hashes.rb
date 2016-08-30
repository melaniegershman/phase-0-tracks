# Write a program that will allow an interior designer to enter the details
# of a given client: the client's name, age, number of children, decor theme
# and more. 

# Keys should be symbols.

# Prompt the designer/user for all of this information (define a method).
# Convert any user input to the appropriate data type.
# Print the hash back out to the screen when the designer has answered all of 
# 	the questions.
# Give the user the opportunity to update a key (no need to loop, once is fine). 
# After all, sometimes users make mistakes! If the designer says "none", skip it. 
# But if the designer enters "decor_theme" (for example), your program should ask 
# for a new value and update the :decor_theme key. (Hint: Strings have methods that 
# will turn them into symbols, which would be quite handy here.) You can assume the 
# user will correctly input a key that exists in your hash -- no need to handle user 
# errors.
# Print the latest version of the hash, and exit the program.

def name
	puts "What is your full name?"
	client_name = gets.chomp
end

def client_form
client_pref = {
	name: "",
	age: '',
	children: '',
	decor: "",
}
	puts "Hello, welcome to Interior Solutions. Please help us help you by answering the following questions."
	client_pref[:name] = name
	p client_pref
end


client_form
