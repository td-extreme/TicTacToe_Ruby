# ./lib/playermanager.rb

require 'gameboard'
require 'player'


class PlayerManager

  attr_reader :current_player

  def initialize (gameboard, player1, player2)
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



end