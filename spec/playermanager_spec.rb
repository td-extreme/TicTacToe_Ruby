require 'ttt'
require 'playermanager'
require 'gameboard'
require 'gameio'
require 'player'

describe PlayerManager do
  let(:myGame) { TicTacToe.new }
  let(:myManager) { PlayerManager.new(myGame) }

  describe "current player and changing players" do
    it "current player should start as player 1" do
      expect(myGame.myPlayers.current_player).to eq(myGame.myPlayers.player1)
    end
    it "after switch_turns current_player should be player 2" do
      myGame.myPlayers.switch_turns
      expect(myGame.myPlayers.current_player).to eq(myGame.myPlayers.player2)
    end
    it "non_current_player returns 'O' when current_player is 'X' " do
      expect(myGame.myPlayers.non_current_player).to eq(myGame.myPlayers.player2)
    end
  end
end
