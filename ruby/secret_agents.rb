# Encrypt method:
# Takes every letter within a string and moves it forward by one. 
# - Accept a string
# - Go through each letter in the string
# - Advance each character within string
# - Store new string.
# - Return new string.
# Decrypt method:
# - Accept a string
# - Take index of letter within alphabet
# - Then subtract one from that index value
# - Use the answer to find the letter
# alphabet="abcdefghijklmnopqrstuvwxyz"
# letter = alphabet.index("d")
# letter -= 1

#Encryptor
def encryptor(msg)
	i = 0
	special_char = " !@#$%^&*()?/<>~"
	while i < msg.length
		while special_char.index(msg[i])
			i += 1
		end		
		msg[i] = msg[i].next
		i += 1
	end
	puts msg
end

#Decryptor 
def decryptor(msg)
	i = 0
	decrypted = "" #assign empty string to collect letters
	while i < msg.length
		alphabet = "abcdefghijklmnopqrstuvwxyz" 
		letter = msg[i]
		pre_alpha_index = alphabet.index(letter)
		pre_alpha_index -= 1
	  	decrypted += alphabet[pre_alpha_index] 
	i += 1
	end
	puts decrypted
end
