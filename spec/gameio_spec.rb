# ./spec/player_spec.rb
require 'gameio'
require 'gameboard'

describe GameIo do
  let (:myBoard) { GameBoard.new }


##  Problem :: can't get this test to send the number 5 to STDIN
##  Will have to research this later and figure that part out.

  describe "Getting user input" do
    it 'returns 5 when user enters 5' do
      expect(STDOUT).to receive(:puts).with("Please enter a move to play")
      allow(STDIN).to receive(:gets) { '5\n' }
      expect(subject.get_human_move).to eq(5)
    end
  end

  describe "Displaying the game board" do
     
    
    it "outputs a blank board when no moves have been played" do
      expect(STDOUT).to receive(:puts).with( "   |   |   \n---+---+---\n   |   |   \n---+---+---\n   |   |   \n")
      expect(subject.print_board myBoard).to eq(nil)
                                              
    end
  
    it "correctly outputs a board with moves played" do
      for i in 0..8
        myBoard.play_move(i, i)
      end
      
      expect(STDOUT).to receive(:puts).with( " 0 | 1 | 2 \n---+---+---\n 3 | 4 | 5 \n---+---+---\n 6 | 7 | 8 \n")
      expect(subject.print_board myBoard).to eq(nil)
    end
 
  describe "displaying the results of a game" do
  
   it "doesn't print anything if the game is still being played" do
     expect(subject.print_game_state(myBoard)).to eq('Playing')
   end  
 
  
    it "prints to terminal tied when the game is tied" do
      for i in 0..8
        myBoard.play_move(i, i)
      end
      expect(STDOUT).to receive(:puts).with("Tied Game!")
      expect(subject.print_game_state(myBoard)).to eq('Tied')    
    end
  
    it "prints Player X is the winner when x wins" do
      for i in 0..2
        myBoard.play_move(i, 'X')
      end
      expect(STDOUT).to receive(:puts).with("Player X is the Winner!")
      expect(subject.print_game_state(myBoard)).to eq('X')
    end
   
  end

  end
end
