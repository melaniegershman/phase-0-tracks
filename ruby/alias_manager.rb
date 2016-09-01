# PSEUDOCODE
# Split all of these into separate steps:

# Take in a name

# Switch first name & last name - DONE
# => Break down these items so you can manipulate them
# => Reverse the first & last name

# Change the vowels to the next vowel
# => Isolate vowels to compare to the characters in your name
# => If a character is a vowel, change it to the next vowel in the sequence mentioned above
# => First, find the vowel, change it, & if it's a consonant, leave it unchanged & move onto the next
# => If a vowel in the name_array == a vowel in the vowel array, the vowel in the name array must 
# 		be reassigned to = vowel[x+1]

# Change the consonants to the next consonant 
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
# reverse_name("Melanie Gershman")

# Vowel changer
def vowel_changer(name)
	name_array = name.chars
	vowels = %w{a e i o u}
	name_array.map! do |letter| 
		if vowels.include?(letter)
			new_vowel_index = vowels.index(letter) + 1
			new_vowel = vowels[new_vowel_index]
		else
			letter
		end		
	end
	p name_array.join('')
end

# Consonant changer
def consonant_changer
	consonants = %w{b c d f g h j k l m n p q r s t v w x y z}
end