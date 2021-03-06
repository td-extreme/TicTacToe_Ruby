require 'player'
require 'gameio'
require 'gameboard'
require 'ttt'

describe Player do

  describe "mark" do
    let(:myIo) { GameIo.new }
    let(:myPlayer1) { Player.new('X') }
    let(:myPlayer2) { Player_PC.new('O') }
    let(:myBoard) { GameBoard.new }

    let(:myGame) { TicTacToe.new }

    it "Should return X when players mark is set to X" do
      expect(myPlayer1.mark).to eq('X')
    end
  end
end
