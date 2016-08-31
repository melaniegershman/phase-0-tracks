# PSEUDOCODE
# Split all of these into separate steps:

# Take in a name

# Switch first name and last name
# => Break down these items so you can manipulate them
# => Reverse the first and last name

# Change the vowels to the next vowel
# => Isolate vowels to compare to the characters in your name
# => If a character is a vowel, change it to the next vowel in the sequence mentioned above

# Change the consonants to the next consonant 
# => Follow protocol from "vowel" pseudocode, but with consonants

# Provide a user interface
# => Ask user for name
# => Return fake name
# => Repeat until user types "quit"

# Store the aliases
# => Store in a way to access both initial name and alias (a key/value pair)
# => Push initial name into key and then push alias into value

# Switch first name and last name
def reverse_name(name)
	reversed_name = name.split(' ').reverse.join(" ")
	puts reversed_name
end

reverse_name("Melanie Gershman")