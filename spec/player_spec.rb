# ./spec/player_spec.rb
require 'player'
require 'gameio'
require 'gameboard'

describe Player do

  describe "mark" do
    let(:myIo) { GameIo.new }
    let(:myPlayer1) { Player.new('X', 'Human') }
    let(:myPlayer2) { Player.new('O', 'PC') }
    let(:myBoard) { GameBoard.new }

    it "Should return X when players mark is set to X" do
      expect(myPlayer1.mark).to eq('X')
    end

    it "Play move should play 5 for X when player is human and enters 5" do
      $stdin = StringIO.new("5")
      expect(myPlayer1.play_move(myIo, myBoard, myPlayer2)).to eq(5)
    end

    it "play_move for PC returns center space when board is empty" do
      expect(myPlayer2.play_move(myIo, myBoard, myPlayer1)).to eq(4)
    end 
 
    it "play_to_win for picks winning move when pc has two in a row" do
      myBoard.play_move(0, 'X')
      myBoard.play_move(4, 'O')
      myBoard.play_move(1, 'X')
      expect(myPlayer1.play_to_win(myIo, myBoard)).to eq(2)
    end

    it "plays corner if it can't win, block, or play center" do
      myBoard.play_move(4, 'X')
      expect(myPlayer2.play_move(myIo, myBoard, myPlayer1)).to eq(0)
    end

    it "plays first avaliable if can't win, block, play center or corner" do
      myBoard.play_move(0, 'X')
      myBoard.play_move(2, 'X')
      myBoard.play_move(6, 'X')
      myBoard.play_move(8, 'X')
      myBoard.play_move(4, 'O')
      expect(myPlayer2.play_move(myIo, myBoard, myPlayer1)).to eq(1)

    end

    it "blocks the opponent from winning" do
      myBoard.play_move(4, 'X')
      myBoard.play_move(0, 'X')
      expect(myPlayer2.play_move(myIo, myBoard, myPlayer1)).to eq(8)
    end


  end

end
