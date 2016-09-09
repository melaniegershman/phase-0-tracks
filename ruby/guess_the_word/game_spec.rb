require_relative 'game'

describe WordGame  do
	let(:game) {WordGame.new}
	it "should print a game board" do 
		game_board = "- " * "hello".length
		expect(game.display_board("hello")).to be == "- - - - - "
	end

	# it "" do
		
	# end

	# it "" do
	# end

end