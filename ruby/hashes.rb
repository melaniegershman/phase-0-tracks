# PSEUDOCODE:
# Ask designer questions about client
# Store responses
# Use stored responses to access keys and update values of a hash with initially empty values
# Print out updated hash
# Ask if user wants to make changes to input
# If user wants to make changes, ask which key needs to be updated.
# Store key and updated value-- if updated value is Fixnum, convert user input to integer.
# Return updated hash and exit program.

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
# Give the user the opportunity to update a key. If the designer says "none", skip it. 
def update(hash)
	puts "Here is a summary of your client's information: #{hash}. Would you like to make changes? Type done if you are finished."
	input = gets.chomp
	if input != "done"
		puts "State the name of the preference you would like to update: name, age, children, color."
		# Convert any user input to the appropriate data type.
		updated_key = gets.chomp.to_sym
		puts "How can I update that?"

		if updated_key == :age || updated_key == :children
			new_value = gets.chomp.to_i
		else
			new_value = gets.chomp
		end	
		# Return updated key-value pair
		hash[updated_key] = new_value
	end
	puts "Thank you for using Interior Solutions."	
	# Return updated hash
	return hash 
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
	# Run "update" method to determine if any changes need to be made to program
	client_pref = update(client_pref)
	# Print the latest version of the hash, and exit the program.
	puts "Here is a summary of your client's information: #{client_pref}."
end

client_form
