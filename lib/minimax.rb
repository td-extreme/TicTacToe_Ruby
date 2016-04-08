# ./lib/minimax.rb
#
#  minimax algorithm for getting best move


class Minimax

  def score(gameboard, player, opponent)
    return 10 if gameboard.game_state == player
    return -10 if gameboard.game_state == opponent
    return 0
  end


  def minimax(gameboard, player, opponent)
    scores = []
    moves = []

    gameboard.available_moves.each do |move|
      possible_gameboard = gameboard
      possible_gameboard.play_move(move, player)
      scores.push minimax(gameboard, opponent, player)					 
    end
  end


end