# PSEUDOCODE
# Split all of these into separate steps:

# Take in a name

# Switch first name & last name 
# => Break down these items so you can manipulate them
# => Reverse the first & last name

# Change the vowels to the next vowel 
# => Isolate vowels to compare to the characters in your name
# => If a character is a vowel, change it to the next vowel in the sequence mentioned above
# => First, find the vowel, change it, & if it's a consonant, leave it unchanged & move onto the next

# Change the consonants to the next consonant 
# => Follow protocol from "vowel" pseudocode, but with consonants
#
# Provide a user interface
# => Ask user for name
# => Return fake name
# => Repeat until user types "quit"

# Store the aliases
# => Store in a way to access both initial name & alias (a key/value pair)
# => Push initial name as key & then store alias into value

# Switch first name and last name
def reverse_name(name)
	reversed_name = name.split(' ').reverse.join(" ")
	reversed_name
end

# Letter changer
def next_letter(name)
	name_array = name.downcase.chars
	vowels = %w{a e i o u}
	consonants = %w{b c d f g h j k l m n p q r s t v w x y z}
	# loop through name and check whether a letter is a vowel or a consonant
	name_array.map! do |letter| 
		# check for edge cases
		if letter == "u"
			letter = "a"
		elsif letter == "z"
			letter = "b"	
		elsif vowels.include?(letter)
			next_letter_arr = vowels
		elsif consonants.include?(letter)
			next_letter_arr = consonants
		end
		# Once determined whether the letter is a vowel or consonant:
		if next_letter_arr
			# reassign the index to that of the next char in the vowel or consonant array
			new_char_index = next_letter_arr.index(letter) + 1
			new_char = next_letter_arr[new_char_index]
		else
			letter
		end		
	end
	name_array.join('').split(" ").each{|i| i.capitalize!}.join(" ")
end

#USER INTERFACE
def alias_manager
	alias_container = {}
	puts "Welcome to Alias Manager 5000. Please enter your first and last name. Enter -quit- When you are finished."
	user_input = gets.chomp
while user_input != "quit"
		reversed_name = reverse_name(user_input)
		user_alias = next_letter(reversed_name)
		alias_container[user_input] = user_alias
		puts "Next name (or type quit):"
		user_input = gets.chomp
		if user_input == "quit"
			puts alias_container.each_pair {|input, output| puts "#{output} is also known as #{input}."}
		end
	end
end

alias_manager

