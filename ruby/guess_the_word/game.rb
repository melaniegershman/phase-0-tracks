=begin
	
Solo Challenge, 6.6: Release 1 - Design a Game

- Ask users their names +

- Ask which user will be inputing a word +

- Take response and print back: “user1, please give me a word!” +

- Take user1’s input and store it +

- Tell user2 that they have x guesses, where x is the length of the word given +

- Print a series of dashes that is equal in length to the secret word (num = word.length) +
 
- Take user2’s input of a letter +

- Iterate over your secret word to see if the letter is included in the secret word
	If the letter matches, it should replace the “-“ with itself
	Else it should print “Nope, guess again! You have [remaining guesses] left” 

- Continue to take user2’s guesses until the user has guessed the word or run out of guesses.
	If the user wins, print “You guessed it!”
	Otherwise print “You were so close!”
	
=end

# game class

class WordGame
	attr_accessor :game_board, :secret_word, :game_over, :guess_count, :guessed_char
	attr_reader :secret_word

	def initialize(secret_word)
		@game_board = "-" * secret_word.length # --> I'm going to need this to have "-" for each letter of the word.
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
	  		puts "Good guess!"
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
  			puts "You win!"
  			game_won = true
  		else
  			puts "Aw man! Better luck next time!"
  		end
  	end
end

# helper methods


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

# puts "Welcome to Guess-The-Word."
# player_one = user_greet_1
# player_two = user_greet_2
# #Ask player one for the secret word, and store it.
# puts "#{player_one}, tell me your word."
# secret_word = gets.chomp
# # set secret word
# game = WordGame.new(secret_word)
# game.secret_word
# puts "#{player_two}, you have #{game.secret_word.length} guesses:"
# game.game_board
# while game.guess_count > 0
# 	puts "Please guess one letter at a time."
# 	letter = gets.chomp
# 	game.check_letter(letter)
# 	break if game.game_over?
# end
