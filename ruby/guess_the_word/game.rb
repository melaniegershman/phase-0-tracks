=begin
	
Solo Challenge, 6.6: Release 1 - Design a Game

Identify two users by asking their names

Ask which user will be inputing a word.

Take response and print back: “user1, please give me a word!”

Take user1’s input and store it

Tell user2 that they have x guesses, where x is the length of the word given. Print a series of dashes that is equal in length to the secret word
num = word.length
def game_board(num)	
	puts “_ “ * num
end
 
Take user2’s input of a letter 

Iterate over your secret word to see if the letter is included in the secret word.
	If the letter matches, it should replace the “-“ with itself
	Else it should print “Nope, guess again! You have [remaining guesses] left.” 

Continue to take user2’s guesses until the user has guessed the word or run out of guesses.
	If the user wins, print “You guessed it!”
	Otherwise print “You were so close!”
	
=end