# PSEUDOCODE
# Split all of these into separate steps:

# Take in a name

# Switch first name & last name - DONE
# => Break down these items so you can manipulate them
# => Reverse the first & last name

# Change the vowels to the next vowel - DONE
# => Isolate vowels to compare to the characters in your name
# => If a character is a vowel, change it to the next vowel in the sequence mentioned above
# => First, find the vowel, change it, & if it's a consonant, leave it unchanged & move onto the next

# Change the consonants to the next consonant - DONE
# => Follow protocol from "vowel" pseudocode, but with consonants

# Provide a user interface
# => Ask user for name
# => Return fake name
# => Repeat until user types "quit"

# Store the aliases
# => Store in a way to access both initial name & alias (a key/value pair)
# => Push initial name into key & then push alias into value

# Switch first name and last name
def reverse_name(name)
	reversed_name = name.split(' ').reverse.join(" ")
	reversed_name
end

# Vowel changer
def next_vowel(name)
	name_array = name.downcase.chars
	vowels = %w{a e i o u}
	# loop through name and check for vowels
	name_array.map! do |letter| 
		# check for edge cases
		if letter == "u"
			letter = "a"
		elsif vowels.include?(letter)
			# if a letter is a vowel, reassign the index to that of the next vowel in the vowel array
			new_vowel_index = vowels.index(letter) + 1
			new_vowel = vowels[new_vowel_index]
		else
			letter
		end		
	end
	name_array.join('')
end

# Consonant changer
def next_consonant(name)
	name_array = name.downcase.chars
	consonants = %w{b c d f g h j k l m n p q r s t v w x y z}
	name_array.map! do |letter| 
		# check for edge cases
		if letter == "z"
			letter = "b"
		elsif consonants.include?(letter)
			new_consonant_index = consonants.index(letter) + 1
			new_consonant = consonants[new_consonant_index]
		else
			letter
		end		
	end
	#Capitalize both first and last name
	name_array.join('').split(" ").each{|i| i.capitalize!}.join(" ")
end

#USER INTERFACE
def alias_manager
	alias_container = {}
	puts "Welcome to Alias Manager 5000. Please enter your first and last name. Enter -quit- When you are finished."
	user_input = gets.chomp
	while user_input != "quit"
		reversed_name = reverse_name(user_input)
		vowels_changed = next_vowel(reversed_name)
		user_alias = next_consonant(vowels_changed)
		alias_container[user_input] = user_alias
		user_input = gets.chomp
		if user_input == "quit"
			puts alias_container.each_pair {|input, output| puts "#{output} is also known as #{input}."}
		end
	end
end

alias_manager

