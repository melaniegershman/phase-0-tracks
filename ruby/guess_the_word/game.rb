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
	attr_accessor :game_board, :secret_word
	attr_reader :secret_word

	def initialize(secret_word)
		@game_board = "-" * secret_word.length # --> I'm going to need this to have "-" for each letter of the word.
		@secret_word = secret_word
		@guess_count = secret_word.length
	end

	def check_letter(letter)
	  	if @secret_word.include?(letter)
	  		char_index = 0
	  		secret_word.each_char do |x|
	  			if x == letter
	  			game_board[char_index] = x
	  			end
	  			char_index += 1
	  		end
	  		puts @game_board
	  	else
	  		puts "Nope, guess again!"
	  		puts @game_board
	  	end
	  @game_board
  	end

end

# helper methods
# game = WordGame.new(@secret_word)
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

# Ask which player will be keeping the word
def assign_keeper(player_one, player_two)
	puts "#{player_one} and #{player_two}, please tell me who is the keeper of mystery word?"
	keeper = gets.chomp.capitalize
	keeper
end

#Ask previously determined 'keeper' for the secret word, and store it.
def store_word(keeper)
	puts "#{keeper}, tell me your word."
	secret_word = gets.chomp
end

# User Interface

# puts "Welcome to Guess-The-Word."
# player_one = user_greet_1
# player_two = user_greet_2
# # set word keeper
# keeper = assign_keeper(player_one, player_two)
# # set secret word
# game.secret_word = store_word(keeper)

# puts "You have #{game.secret_word.length} guesses:"
# game.game_board
# puts "Please guess one letter at a time."
# letter = gets.chomp
# game.check_letter(letter)

