require_relative 'minimax'

class Player

  attr_accessor :mark
  attr_accessor :type

  def initialize (mark)
    @mark = mark
  end

  def play_move(ttt_game)
    ttt_game.myIo.get_human_move
  end

end


class Player_PC < Player
  def play_move(ttt_game)
    myMinimax = Minimax.new(ttt_game)
    myMinimax.play_move(ttt_game)
  end
end
