require_relative 'gameboard'
require_relative 'player'

class PlayerManager
  attr_reader :current_player
  attr_reader :player1
  attr_reader :player2

   def initialize (ttt_game)
    @myGame = ttt_game
    @io = ttt_game.myIo
    @myBoard = ttt_game.myBoard
    @player1 = Player.new('X', 'Human')
    @player2 = Player.new('O', 'PC')
    @current_player = @player1
  end

  def switch_turns
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def non_current_player
    if @current_player == @player1
      @player2
    else
      @player1
    end
  end

  def play_turn (offset = 0)
    move = @current_player.play_move(@myGame)
    mark = @current_player.mark
    offset = 0 if @current_player.type == 'PC'
    puts offset
    switch_turns if @myBoard.play_move(move + offset, mark)
    move
  end
end
