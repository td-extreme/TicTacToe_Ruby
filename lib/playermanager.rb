require_relative 'gameboard'
require_relative 'player'

class PlayerManager
  attr_reader :current_player, :non_current_player
  attr_reader :player1
  attr_reader :player2

   def initialize (gameboard, gameio)
    @myBoard = gameboard
    @myIo = gameio
    @player1 = Player.new('X')
    @player2 = Player_PC.new('O')
    @current_player = @player1
    @non_current_player = @player2
  end

  def switch_turns
    temp = @current_player
    @current_player = @non_current_player
    @non_current_player = temp
  end

  def non_current_player
    if @current_player == @player1
      @player2
    else
      @player1
    end
  end

  def play_turn ()
    move = @current_player.play_move(@myIo, @myBoard, @current_player, @non_current_player)
    mark = @current_player.mark
    switch_turns if @myBoard.play_move(move, mark)
    move
  end

  def set_players (input = 0)
    input = get_user_players_choice if input == 0
    case input
      when 1
        @player1 = Player.new('X')
        @player2 = Player_PC.new('O')
      when 2
        @player1 = Player_PC.new('X')
        @player2 = Player.new('O')
      when 3
        @player1 = Player.new('X')
        @player2 = Player.new('O')
      when 4
        @player1 = Player_PC.new('X')
        @player2 = Player_PC.new('O')
    end
    @current_player = @player1
    @non_current_player = @player2
  end


  def get_user_players_choice
    begin
      @myIo.clear_screen
      @myIo.print_message("Game Modes\n1. Human 'X' vs PC 'O'\n2. PC 'X' vs Human 'O'\n3. Human vs Human\n4. PC vs PC")
      input = @myIo.get_input.to_i
    end while !(input.between?(1, 4))
    input
  end
end
