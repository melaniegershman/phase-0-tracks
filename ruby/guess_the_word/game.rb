=begin
	
Solo Challenge, 6.6: Release 1 - Design a Game

- Ask users their names 

- Print: “user1, please give me a word!” 

- Take user1’s input and store it 

- Tell user2 that they have x guesses, where x is the length of the word given 

- Print a series of dashes that is equal in length to the secret word 
 
- Take user2’s input of a letter 

- WHILE the guess amount is less than the length of the word
	input: a letter
	steps: 
	- check if the letter is in the word
	- IF the letter is in the word
	    - print out “nice work!”
	    - replace its equivalent space in the game board with the letter that was guessed
	    - print out the updated game board
	- IF NOT in the word
	    - print out “sorry, that wasn’t it!”
	    - print game board
	- then:
	    - tell the user how many guesses are left 
	    - store the letter to a collection of letters that have already been guessed
	    - take another letter as input
	output: updated game board and affirmative or negative statement

- Continue to take user2’s guesses until the user has guessed the word or run out of guesses.
	If the user wins, print “You guessed it!”
	Otherwise print "Aw man! Better luck next time!"
=end

# ------ Game Class ------

class WordGame
	attr_accessor :game_board, :secret_word, :game_over, :guess_count, :guessed_char
	attr_reader :secret_word

	def initialize(secret_word)
		@game_board = "-" * secret_word.length 
		@secret_word = secret_word
		@guess_count = secret_word.length * 2
		@game_over = false
		@guessed_char = []
		@game_won = false
	end

	def check_letter(letter)	
		# If user has already guessed a letter:
	  	return puts "You already guessed #{letter}! Try another one." if @guessed_char.include?(letter)
	  	# If user inputs a letter that is in the secret word:
	  	if @secret_word.include?(letter)
	  		# Friendly guy to cheer player on
	  		puts "		d(^o^)/"
	  		# Check every char in the word to see if it matches the guessed letter
	  		char_index = 0
	  		secret_word.each_char do |x|
	  			if x == letter
	  			game_board[char_index] = x
	  			end
	  			char_index += 1
	  		end
	  		puts @game_board
	  	# If letter is not included in the secret word:
	  	else
	  		puts "Nope, guess again!"
	  		puts @game_board
	  	end
	  # Add letter to "guessed char" array to ensure the user's repeat guesses don't count against them
	  @guessed_char << letter	
	  @guess_count -= 1	
	  puts "You have #{@guess_count} guess(es) left."
	  @game_board
  	end

  	def game_over?
  		if @game_board == @secret_word || @guess_count == 0
  			@game_over = true
  		end
  		@game_over
  	end

  	def game_won
  		if @game_board == @secret_word
  			puts "You guessed it!"
  			game_won = true
  		else
  			puts "Aw man! Better luck next time!"
  		end
  	end
end

# ------ Helper methods ------

# Identify players
def user_greet_1
	puts "Player One, what's your name?"
	player_one = gets.chomp.capitalize
	puts "Thank you, #{player_one}."
	player_one
end

def user_greet_2
	puts "Player Two, tell me your name."
	player_two = gets.chomp.capitalize
	puts "Thank you, #{player_two}."
	player_two
end

# ------ User Interface ------

puts "Welcome to Guess-The-Word."
player_one = user_greet_1
player_two = user_greet_2
#Ask player one for the secret word, and store it.
puts "#{player_one}, tell me your word."
secret_word = gets.chomp
# set secret word
game = WordGame.new(secret_word)
game.secret_word
# "clears" screen so user two can guess letters without cheating
puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
puts "#{player_two}, you have #{game.guess_count} guesses:"
game.game_board
while game.guess_count > 0
	puts "Please guess one letter at a time."
	letter = gets.chomp
	game.check_letter(letter)
	break if game.game_over?
end
game.game_won