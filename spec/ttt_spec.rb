#spec/ttt_spec.rb
require 'ttt'
describe TicTacToe do
  
  describe "playing moves" do
    
    before do
      @myTTT = TicTacToe.new
    end

    it "valid_move? return true if space is free" do
      expect(@myTTT.valid_move?(1)).to be true
    end
 
    it "valid_move? return false if space is taken" do
      @myTTT.play_move(1, 'X')
      expect(@myTTT.valid_move?(1)).to be false
    end

    it "play_move sets space to player" do
      @myTTT.play_move(1, 'X')
      expect(@myTTT.get_space(1)).to eq('X')
    end
  
    it "play_move doesn't change player if spot is taken" do
      @myTTT.play_move(1, 'X')
      @myTTT.play_move(1, 'O')
      expect(@myTTT.get_space(1)).to eq('X')
    end

    it "the board spaces should all be valid_moves after clear" do
      @myTTT.play_move(1, 'X')
      @myTTT.play_move(2, 'O')
      @myTTT.clear_board
      expect(@myTTT.valid_move?(2)).to be true
    end

  end

  describe "" do
    
    before do
      @myTTT = TicTacToe.new
    end
    
  end

end