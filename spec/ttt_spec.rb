#spec/ttt_spec.rb
require 'ttt'
describe TicTacToe do
  
  describe "playing moves" do
    
    before do
      @myTTT = TicTacToe.new

    end

    it "valid_move? return true if space is free" do
      expect(@myTTT.valid_move?).to be true
    end

  end
  

end