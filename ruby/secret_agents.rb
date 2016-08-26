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

#Encryptor
def encryptor(msg)
	i = 0
	while i < msg.length
		if msg[i] == "z"
			msg[i] == "a"
		elsif msg[i] == " "
			msg[i] = msg[i]
		else
			msg[i] = msg[i].next
		end
		i += 1
	end
	return msg
end

#DRIVER CODE:
puts encryptor("abc")
puts encryptor("zed")

#Decryptor 
def decryptor(msg)
	i = 0
	alphabet = "abcdefghijklmnopqrstuvwxyz" 
	#assign empty string to collect letters
	decrypted = "" 
	while i < msg.length
		if msg[i] == "z"
			msg[i] = "a"
		elsif msg[i] == " "
			decrypted[i] = msg[i]
		else
			alpha_index = (alphabet.index(msg[i])) - 1
		  	decrypted[i] = alphabet[alpha_index]
		end
	i += 1
	end
	return decrypted
end

#DRIVER CODE:
puts decryptor("bcd")
puts decryptor("afe")
