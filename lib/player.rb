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
  end  


  def get_human_move(game_io, gameboard, opponent)
    game_io.get_human_move
  end

end