# --> Paired with Travis Buckley. <--
# Encrypt method:
# Takes every letter within a string and moves it forward by one. 
# - Accept a string
# - Go through each letter in the string
# - Advance each character within string
# - Store new string
# - Return new string
# - Test for edgecase, z should be followed by a, not ab.


# Decrypt method:
# Reverses the encryptor.
# - Accept a string
# - Take index of letter within alphabet
# - Then subtract one from that index value
# - Use the answer to find the letter
# - Store new string
# alphabet="abcdefghijklmnopqrstuvwxyz"
# letter = alphabet.index("d")
# letter -= 1
# - Test for edgecase, z should be followed by a, not ab.

# Interface pseydocode:
# Ask user for password, and store password.
# Ask the user IF they want to encrypt or decrypt. 
# Intake user input.
# Runs user preference & prints results.
# Program ends with self-destruct message.


#Encryptor
def encrypt(str)
	i = 0
	while i < str.length
		if str[i] == "z"
			str[i] = "a"
		elsif !"abcdefghijklmnopqrstuvwxyz".include?(str[i])
			str[i] = str[i]
		else
			str[i] = str[i].next
		end
		i += 1
	end
	str
end

#DRIVER CODE:
# p encryptor("abc")
# p encryptor("zed")

#Decryptor 
def decryptor(msg)
	i = 0
	alphabet = "abcdefghijklmnopqrstuvwxyz" 
	while i < msg.length
		if msg[i] == "z"
			msg[i] = "a"
		elsif msg[i] == " "
			msg[i] = msg[i]
		else
			alpha_index = (alphabet.index(msg[i])) - 1 
		  	msg[i] = alphabet[alpha_index]
	  	end
	i += 1
	end
	msg
end

#DRIVER CODE:
# p decryptor("bcd")
# p decryptor("afe")

# p decryptor(encryptor("swordfish"))

#The order of operations is what allows nesting encryptor inside of decryptor to work. 
# Encryptor encrypts "swordfish", which gives us a new parameter ("txpsegjti") to be decoded 
# by decryptor. Decryptor accepts the new string and proceeds to decode "txpsegjti".

#OUR DRIVER CODE:
# ask for password and store
puts "What is your secret password?"
password = gets.chomp

# ask whether to encrypt or decrypt
puts "Encryptor or decryptor?"
user_input = gets.chomp.downcase
until user_input == "encryptor" || user_input == "decryptor"
	puts "Please only enter encryptor or decryptor"
	user_input = gets.chomp.downcase
end

if user_input == "encryptor"
	p encryptor(password)
elsif user_input == "decryptor"
	p decryptor(password)
end

#Exit program.
puts "This message will self-destruct in 5 seconds."
i = 5
while i > 0
	puts "#{i}..."
	i = i - 1
	sleep 1
end
puts "BOOM!"