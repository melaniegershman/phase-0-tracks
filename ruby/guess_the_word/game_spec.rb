require_relative 'game'

describe WordGame  do
	let(:game) {WordGame.new("hello")}

	it "should print a game board" do 
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
		expect(game.guess_count).to eq 9
	end

	it "should check if game is over" do
		game.game_board = game.secret_word	
		expect(game.game_over?).to be true
	end

	it "should check if game is over" do
		game.guess_count = 0	
		expect(game.game_over?).to be true
	end

	it "should check if game is won" do
		game.game_board = game.secret_word
		expect(game.game_won). to be true
	end

end