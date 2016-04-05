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




  end
  

end