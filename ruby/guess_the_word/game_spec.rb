require_relative 'game'

describe WordGame  do
	let(:game) {WordGame.new("hello")}

	it "should print a game board" do 
		# game_board = "-" * "hello".length
		expect(game.game_board).to be == "-----"
	end

	it "should check if a letter is in the secret word" do
		expect(game.check_letter("l")).to be == "--ll-"
	end

	it "should check if a letter is not in the secret word" do
		expect(game.check_letter("z")).to be == "-----"
	end

	it "should store a guessed letter to guessed_char array" do
		expect(game.check_letter("z")).to be == "-----"
		expect(game.guessed_char).to include "z"
	end

	it "should decrease your guess count by 1" do
		expect(game.check_letter("z")).to be == "-----"
		expect(game.guess_count).to eq 4
	end

	# it "should check if you won" do
	# 	@game_board == @secret_word
	# 	expect(game.game_won?).to be true
	# end

end