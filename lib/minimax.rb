# ./lib/minimax.rb
#
#  minimax algorithm for getting best move


class Minimax

  def score(gameboard, player, opponent)
    return 10 if gameboard.game_state == player
    return -10 if gameboard.game_state == opponent
    return 0
  end


end