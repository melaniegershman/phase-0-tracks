require_relative 'game'

describe WordGame  do
	let(:game) {WordGame.new("hello")}

	it "should print a game board" do 
		game_board = "- " * "hello".length
		expect(game.display_board("hello")).to be == "- - - - - "
	end

	it "should check if a letter is in the secret word" do
		expect(game.check_letter("l")).to be == "- - ll- "	
	end

	# it "" do
	# end

end