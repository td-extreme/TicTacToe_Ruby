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
