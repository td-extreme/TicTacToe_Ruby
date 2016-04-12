require 'minimax'
require 'gameboard'

describe Minimax do
  let(:myBoard) { GameBoard.new }
  let(:myGame) { TicTacToe.new }
  let(:myMinimax) { Minimax.new() }

   before do
    @myBoard = myGame.myBoard
    @player1 = myGame.myPlayers.player1
    @player2 = myGame.myPlayers.player2
  end

  describe "getting best move" do
    it "returns 8 when board is blank" do
      expect(myMinimax.play_move(@myBoard, @player1, @player2)).to eq(8)
    end
    it "blocks the opponent from winning" do
      myGame.myBoard.play_move(0, 'O')
      myGame.myBoard.play_move(4, 'X')
      myGame.myBoard.play_move(1, 'O')
      expect(myMinimax.play_move(@myBoard, @player1, @player2)).to eq(2)
    end
    it "plays the winning move if it can" do
      myGame.myBoard.play_move(0, 'X')
      myGame.myBoard.play_move(3, 'X')
      myGame.myBoard.play_move(5, 'O')
      myGame.myBoard.play_move(8, 'O')
      expect(myMinimax.play_move(@myBoard, @player1, @player2)).to eq(6)
    end
  end
end
