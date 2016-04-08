# ./spec/minimax_spec.rb
require 'minimax'
require 'gameboard'


describe Minimax do
let(:myBoard) { GameBoard.new }

  
  describe "Calculating score" do
    it "returns 10 if game is won" do
      myBoard.play_move(0, 'X')
      myBoard.play_move(1, 'X')
      myBoard.play_move(2, 'X')
      expect(subject.score(myBoard, 'X', 'O')).to eq(10)
    end

    it "return -10 if game is lost" do
      myBoard.play_move(0, 'O')
      myBoard.play_move(1, 'O')
      myBoard.play_move(2, 'O')
      expect(subject.score(myBoard, 'X', 'O')).to eq(-10)
    end

    it "returns 0 if game is still going" do
      expect(subject.score(myBoard, 'X', 'O')).to eq(0)
    end

  end

  describe "getting bet move" do


  end
  


end