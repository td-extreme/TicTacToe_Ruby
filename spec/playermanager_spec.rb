# ./spec/playermanager_spec.rb

require 'playermanager'
require 'gameboard'
require 'gameio'
require 'player'

describe PlayerManager do
  let(:myIo) { GameIo.new }
  let(:myBoard) { GameBoard.new }
  let(:player1) { Player.new('X', 'Human') }
  let(:player2) { Player.new('O', 'Human') }

  let(:myManager) { PlayerManager.new(myIo, myBoard, player1, player2) }

  describe "current player and changing players" do
    it "current player should start as player 1" do
      expect(myManager.current_player).to eq(player1)
    end
    it "after switch_turns current_player should be player 2" do
      myManager.switch_turns
      expect(myManager.current_player).to eq(player2)
    end  
 
    it "non_current_player returns 'O' when current_player is 'X' " do
      expect(myManager.non_current_player).to eq(player2)
    end  

  end
  
 
end