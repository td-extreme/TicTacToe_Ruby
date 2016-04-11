require 'minimax'
require 'gameboard'

describe Minimax do
let(:myBoard) { GameBoard.new }
let(:myGame) { TicTacToe.new }
let(:myMinimax) { Minimax.new(myGame) }

  describe "Calculating score" do
    it "returns 10 if game is won" do
      myGame.myBoard.play_move(0, 'X')
      myGame.myBoard.play_move(1, 'X')
      myGame.myBoard.play_move(2, 'X')
      expect(myMinimax.score(myGame)).to eq(10)
    end
    it "return -10 if game is lost" do
      myGame.myBoard.play_move(0, 'O')
      myGame.myBoard.play_move(1, 'O')
      myGame.myBoard.play_move(2, 'O')
      expect(myMinimax.score(myGame)).to eq(-10)
    end
    it "returns 0 if game is still going" do
      expect(myMinimax.score(myGame)).to eq(0)
    end
  end

  describe "getting best move" do
    it "returns 8 when board is blank" do
      expect(myMinimax.play_move(myGame)).to eq(8)
    end
    it "blocks the opponent from winning" do
      myGame.myBoard.play_move(0, 'O')
      myGame.myBoard.play_move(4, 'X')
      myGame.myBoard.play_move(1, 'O')
      expect(myMinimax.play_move(myGame)).to eq(2)
    end
    it "plays the winning move if it can" do
      myGame.myBoard.play_move(0, 'X')
      myGame.myBoard.play_move(3, 'X')
      myGame.myBoard.play_move(5, 'O')
      myGame.myBoard.play_move(8, 'O')
      expect(myMinimax.play_move(myGame)).to eq(6)
    end
  end
end
