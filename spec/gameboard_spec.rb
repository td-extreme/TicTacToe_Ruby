#spec/ttt_spec.rb
require 'stringio'
require 'gameboard'

describe GameBoard do

  describe "cloning" do
    it "makes a deep copy when cloning" do
      subject.clear_board('T')
      testBoard = subject.clone
      subject.clear_board(' ')
      expect(testBoard.get_space(0)).to eq('T')
    end
  end


  describe "playing moves" do

    it "returns an array of 9 spaces when available_moves is called on empty board " do
      expect(subject.available_moves.size).to eq(9)
    end

    it "returns an array of 0 spaces when available_moves is called on a full board " do
      subject.clear_board('T')
      expect(subject.available_moves.size).to eq(0)
    end


    it "valid_move? return true if space is free" do
      expect(subject.valid_move?(1)).to be true
    end

    it "valid_move? returns false if space is > 8" do
      expect(subject.valid_move?(9)).to be false
    end

    it "valid_move? returns false if space is < 0" do
      expect(subject.valid_move?(-1)).to be false
    end

    it "valid_move? return false if space is taken" do
      subject.play_move(1, 'X')
      expect(subject.valid_move?(1)).to be false
    end

    it "valid_move? return false if paramater is int outside of score" do
      expect(subject.valid_move?(9)).to be false
    end

    it "valid_move? return false if parameter for space is invalid" do
      expect(subject.valid_move?(false)).to be false
    end

    it "play_move sets space to player" do
      subject.play_move(1, 'X')
      expect(subject.get_space(1)).to eq('X')
    end

    it "play_move doesn't change player if spot is taken" do
      subject.play_move(1, 'X')
      subject.play_move(1, 'O')
      expect(subject.get_space(1)).to eq('X')
    end

    it "the board spaces should all be valid_moves after clear" do
      subject.play_move(1, 'X')
      subject.play_move(2, 'O')
      subject.clear_board
      expect(subject.valid_move?(2)).to be true
    end


  end

  describe "Checking Game Status ie Playing, Winner, Tied" do

    it  "Reutnrs 'Playing' when game is still going on" do
      expect(subject.game_state).to eq('Playing')
    end

    it "Returns 'X' as winner when 'X' has 3 in a row" do
      subject.play_move(0, 'X')
      subject.play_move(1, 'X')
      subject.play_move(2, 'X')
      expect(subject.game_state).to eq('X')
    end

    it "Returns 'X' as winner when 'X' has 3 in a row second row" do
      subject.play_move(3, 'X')
      subject.play_move(4, 'X')
      subject.play_move(5, 'X')
      expect(subject.game_state).to eq('X')
    end

    it "Returns 'X' as winner when 'X' has 3 in a row third row" do
      subject.play_move(6, 'X')
      subject.play_move(7, 'X')
      subject.play_move(8, 'X')
      expect(subject.game_state).to eq('X')
    end

    it "Returns 'X' as winner when 'X' has 3 in a col first col" do
      subject.play_move(0, 'X')
      subject.play_move(3, 'X')
      subject.play_move(6, 'X')
      expect(subject.game_state).to eq('X')
    end

    it "Returns 'X' as winner when 'X' has 3 in a col second col" do
      subject.play_move(1, 'X')
      subject.play_move(4, 'X')
      subject.play_move(7, 'X')
      expect(subject.game_state).to eq('X')
    end

    it "Returns 'X' as winner when 'X' has 3 in a col third col" do
      subject.play_move(2, 'X')
      subject.play_move(5, 'X')
      subject.play_move(8, 'X')
      expect(subject.game_state).to eq('X')
    end

    it "Returns 'X' as winner when 'X' has 3 in a diagnal descending" do
      subject.play_move(0, 'X')
      subject.play_move(4, 'X')
      subject.play_move(8, 'X')
      expect(subject.game_state).to eq('X')
    end

    it "Returns 'X' as winner when 'X' has 3 in a diagnal ascending" do
      subject.play_move(6, 'X')
      subject.play_move(4, 'X')
      subject.play_move(2, 'X')
      expect(subject.game_state).to eq('X')
    end

    it "Returns 'Tied' if game no moves left and there is no winner" do
      for i in 0..8
        subject.play_move(i, i)
      end
      expect(subject.game_state).to eq('Tied')
    end
  end
end
