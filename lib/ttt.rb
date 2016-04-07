# ./lib/ttt.rb

require_relative 'gameio'
require_relative 'playermanager'
require_relative 'player'
require_relative 'gameboard'

class TicTacToe

  def initialize
    @myIo = GameIo.new
    @player1 = Player.new('X', 'Human')
    @player2 = Player.new('O', 'Human')
    @myBoard = GameBoard.new
    @myPlayers = PlayerManager.new(@myIo, @myBoard, @player1, @player2)
    @key = GameBoard.new
    for i in 0..8 
      @key.play_move(i, i + 1)
    end
  end

  def game_loop 
    begin
      @myIo.clear_screen
      @myIo.print_board(@key)
      @myIo.print_board(@myBoard)
      @myPlayers.play_turn(-1)
    end while @myBoard.game_state == 'Playing' 
      @myIo.clear_screen
      @myIo.print_board(@key)
      @myIo.print_board(@myBoard)
      @myIo.print_game_state(@myBoard)
  end
end

myGame = TicTacToe.new
myGame.game_loop