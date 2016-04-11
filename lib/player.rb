require_relative 'minimax'

class Player

  attr_accessor :mark
  attr_accessor :type

  def initialize (mark, type)
    @mark = mark
    @type = type

  end

  def play_move(ttt_game)
    return get_human_move(ttt_game) if @type == 'Human'
    return get_pc_move(ttt_game) if @type == 'PC'
  end


  def get_human_move(ttt_game)
    ttt_game.myIo.get_human_move
  end

  def get_pc_move(ttt_game)
    myMinimax = Minimax.new(ttt_game)
    myMinimax.play_move(ttt_game)
  end
end

=begin

  def get_pc_move(ttt_game)
    rtn_move = -1
    rtn_move =  play_to_win(game_io, gameboard)
    return rtn_move if rtn_move != -1
    rtn_move = opponent.play_to_win(game_io, gameboard)
    return rtn_move if rtn_move != -1
    return 4 if gameboard.get_space(4) == ' '
    rtn_move = get_corner(gameboard)
    return rtn_move if rtn_move != -1
    return rnd_move
  end

  def rnd_move(gameboard)
    gameboard.board.each.with_index do |val, i|
      return i if val == ' '
    end
  end

  def get_corner(gameboard)
    test_spaces = [0,2,6,8]
    test_spaces.each do |val|
      return val if gameboard.get_space(val) == ' '
    end
  end

  def play_to_win(game_io, gameboard)
    gameboard.board.each.with_index do |val, i|
      if val == ' '
        gameboard.set_space(i, mark)
        if gameboard.game_state == mark
          gameboard.set_space(i, ' ')
          return i
        end
        gameboard.set_space(i, ' ')
      end
    end
    return -1
  end
end
=end
