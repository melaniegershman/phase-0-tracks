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
	while i < msg.length
	  msg[i] = msg[i].next!
	  i += 1
	end
	puts msg
end

