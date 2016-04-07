# ./lib/player.rb

class Player

  attr_accessor :mark
  attr_accessor :type

  def initialize (mark, type)
    @mark = mark
    @type = type

  end

  def play_move(game_io, gameboard, opponent) 
    return get_human_move(game_io, gameboard, opponent) if @type == 'Human'   
    return get_pc_move(game_io, gameboard, opponent) if @type == 'PC'
  end  


  def get_human_move(game_io, gameboard, opponent)
    game_io.get_human_move
  end


  def get_pc_move(game_io, gameboard, opponent)
    rtn_move = -1
    rtn_move =  play_to_win(game_io, gameboard, opponent)
    return rtn_move if rtn_move != -1
    rtn_move = opponent.play_to_win(game_io, gameboard, self)
    return rtn_move if rtn_move != -1
    return 4 if gameboard.get_space(4) == ' '
    rtn_move = get_corner(gameboard)
    return rtn_move if rtn_move != -1
  end

  def get_corner(gameboard)
    test_spaces = [0,2,6,8]
    test_spaces.each do |val|
      return val if gameboard.get_space(val) == ' '
    end
  end

  def play_to_win(game_io, gameboard, opponent)
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