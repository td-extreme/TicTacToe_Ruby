# ./lib/playermanager.rb

require_relative 'gameboard'
require_relative 'player'


class PlayerManager

  attr_reader :current_player

  def initialize (game_io, gameboard, player1, player2)
    @io = game_io
    @myBoard = gameboard
    @player1 = player1
    @player2 = player2
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
    move = @current_player.play_move(@io, @myBoard, @player2) 
    mark = @current_player.mark
    switch_turns if @myBoard.play_move(move + offset, mark)
    move
  end


end