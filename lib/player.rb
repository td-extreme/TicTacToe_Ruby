require_relative 'minimax'

class Player

  attr_accessor :mark

  def initialize (mark)
    @mark = mark
  end

  def play_move(myIo, myBoard, player, opponent)
    myIo.get_human_move
  end
end

class Player_PC

  attr_reader :mark
  def initialize (mark)
    @bestMove = Minimax.new
    @mark = mark
  end

  def play_move(myIo, myBoard, player, opponent)
    @bestMove.play_move(myBoard, player, opponent)
  end
end
