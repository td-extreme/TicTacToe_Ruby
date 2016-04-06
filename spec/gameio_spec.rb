# ./spec/player_spec.rb
require 'gameio'

describe GameIo do
  
  describe "Displaying the game board" do
    
    it "outputs a blank board when no moves have been played" do
      expect(STDOUT).to receive(:puts).with( "   |   |   \n---+---+---\n   |   |   \n---+---+---\n   |   |   \n")
      expect(subject.print_board).to eq(nil)
                                              
    end
  
    it "correctly outputs a board with moves played" do
      for i in 0..8
        subject.play_move(i, i)
      end
      
      expect(STDOUT).to receive(:puts).with( " 0 | 1 | 2 \n---+---+---\n 3 | 4 | 5 \n---+---+---\n 6 | 7 | 8 \n")
      expect(subject.print_board).to eq(nil)
    end
 

end
