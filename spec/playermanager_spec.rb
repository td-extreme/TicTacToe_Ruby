require 'ttt'
require 'playermanager'
require 'gameboard'
require 'gameio'
require 'player'

describe PlayerManager do
  let(:myGame) { TicTacToe.new }
  let(:myManager) { PlayerManager.new(myGame.myBoard, myGame.myIo) }

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

  describe "setting up players" do
      #specify {myManager.get_user_players_choice = 2}
      #choice = int

    it "User chooses option 2" do
      myManager.set_players(2)
      expect(myManager.player1.class).to eq(Player_PC)
    end
    it "User chooses option 3" do
      myManager.set_players(3)
      expect(myManager.player2.class).to eq(Player)
    end
  end
end
