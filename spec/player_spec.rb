# ./spec/player_spec.rb
require 'player'
require 'gameio'
require 'gameboard'

describe Player do

  describe "mark" do
    let(:myIo) { GameIo.new }
    let(:myPlayer1) { Player.new('X', 'Human') }
    let(:myPlayer2) { Player.new('O', 'Human') }
    let(:myBoard) { GameBoard.new }

    it "Should return X when players mark is set to X" do
      expect(myPlayer1.mark).to eq('X')
    end

    it "Play move should play 5 for X when player enters 5" do
      $stdin = StringIO.new("5")
      expect(myPlayer1.play_move(myIo, myBoard, myPlayer2)).to eq(5)
    end


  end

end
