require_relative 'gameio'
require_relative 'playermanager'
require_relative 'gameboard'

class TicTacToe

  attr_reader :myIo
  attr_reader :myBoard
  attr_reader :myPlayers

  def initialize
    @myIo = GameIo.new
    @myBoard = GameBoard.new

    @key = GameBoard.new
    @key.board.each.with_index do |val, i|
      @key.play_move(i, i + 1)
    end
    @myPlayers = PlayerManager.new(self)
  end

  def print_board
    @myIo.print_board(@myBoard)
  end

  def game_state
    return @myBoard.game_state
  end

  def game_loop
    begin
      @myIo.clear_screen
      @myIo.print_message('    KEY')
      @myIo.print_board(@key)
      @myIo.print_message("\n GAME BOARD")
      @myIo.print_board(@myBoard)
      @myPlayers.play_turn(-1)
    end while @myBoard.game_state == 'Playing'
      @myIo.clear_screen
      @myIo.clear_screen
      @myIo.print_message('    KEY')
      @myIo.print_board(@key)
      @myIo.print_message("\n GAME BOARD")
      @myIo.print_board(@myBoard)
      @myIo.print_game_state(@myBoard)
  end
end
