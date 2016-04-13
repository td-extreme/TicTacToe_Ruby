#spec/ttt_spec.rb
require 'stringio'
require 'gameboard'

describe GameBoard do

  describe "cloning" do
    it "makes a deep copy when cloning" do
      subject.clear_board('T')
      testBoard = subject.deep_copy
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

  describe "Checking Game Status ie Playing, Winner, Tied on a 3x3 board" do

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

    it "Returns 'X' as winner when 'X' has 3 in a diagonal descending" do
      subject.play_move(0, 'X')
      subject.play_move(4, 'X')
      subject.play_move(8, 'X')
      expect(subject.game_state).to eq('X')
    end

    it "Returns 'X' as winner when 'X' has 3 in a diagonal ascending" do
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

  describe "Testing a 4x4 board" do
    let(:board4x4) {GameBoard.new(4)}
    it "valid_move(15) should return true on a 4x4 board" do
      expect(board4x4.valid_move?(15)).to eq(true)
    end
    it "valid_move(16) should return false on a 4x4 board" do
      expect(board4x4.valid_move?(16)).to eq(false)
    end

    it "Returns 'X' as winner when 'X' has 3 in a row" do
      board4x4.play_move(3, 'X')
      board4x4.play_move(1, 'X')
      board4x4.play_move(2, 'X')
      expect(board4x4.game_state).to eq('X')
    end

    it "Returns 'X' as winner when 'X' has 3 in a col" do
      board4x4.play_move(7, 'X')
      board4x4.play_move(11, 'X')
      board4x4.play_move(15, 'X')
      expect(board4x4.game_state).to eq('X')
    end

    it "Retuns 'X' as winner when 'X' has 3 in a row diagonal right" do
      board4x4.play_move(1, 'X')
      board4x4.play_move(6, 'X')
      board4x4.play_move(11, 'X')
      expect(board4x4.game_state).to eq('X')
    end
    it "Returns 'X' as winner when 'X' has 3 in a row diagonal left" do
      board4x4.play_move(7, 'X')
      board4x4.play_move(10, 'X')
      board4x4.play_move(13, 'X')
      expect(board4x4.game_state).to eq('X')
    end
  end
  describe "Testing a 10x10 board" do
    let(:board10x10) {GameBoard.new(10)}
    it "Returns 'X' as the winner when 'X' has 3 in a rwo diagonal left" do
        board10x10.play_move(99, 'X')
        board10x10.play_move(88, 'X')
        board10x10.play_move(77, 'X')
        expect(board10x10.game_state).to eq('X')
    end

  end
end
