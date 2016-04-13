# ./spec/player_spec.rb
require 'gameio'
require 'gameboard'

describe GameIo do
  let (:myBoard) { GameBoard.new }
  let (:myBoard5x5) { GameBoard.new(5) }
  describe "Displaying the game board" do

    it "outputs a blank board when no moves have been played" do
      expect(STDOUT).to receive(:puts).with( "\n   |   |   \n---+---+---\n   |   |   \n---+---+---\n   |   |   \n")
      expect(subject.print_board myBoard).to eq(nil)
    end

    it "outputs a 5x5 board" do
      values = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o']
      for i in 0...25
        myBoard5x5.play_move(i, values[i])

      end
      expect(STDOUT).to receive(:puts).with("\n 0 | 1 | 2 | 3 | 4 \n---+---+---+---+---\n 5 | 6 | 7 | 8 | 9 \n---+---+---+---+---\n a | b | c | d | e \n---+---+---+---+---\n f | g | h | i | j \n---+---+---+---+---\n k | l | m | n | o \n")
      expect(subject.print_board myBoard5x5).to eq(nil)
    end


    it "correctly outputs a board with moves played" do
      for i in 0..8
        myBoard.play_move(i, i)
      end

      expect(STDOUT).to receive(:puts).with( "\n 0 | 1 | 2 \n---+---+---\n 3 | 4 | 5 \n---+---+---\n 6 | 7 | 8 \n")
      expect(subject.print_board myBoard).to eq(nil)
    end
  end
  describe "displaying the results of a game" do

   it "doesn't print anything if the game is still being played" do
     expect(subject.print_game_state(myBoard)).to eq('Playing')
   end

   it "prints to terminal tied when the game is tied" do
     for i in 0..8
       myBoard.play_move(i, i)
     end
     expect(STDOUT).to receive(:puts).with("Tied Game!")
     expect(subject.print_game_state(myBoard)).to eq('Tied')
   end

   it "prints Player X is the winner when x wins" do
     for i in 0..2
       myBoard.play_move(i, 'X')
     end
     expect(STDOUT).to receive(:puts).with("Player X is the Winner!")
     expect(subject.print_game_state(myBoard)).to eq('X')
   end
  end
end
