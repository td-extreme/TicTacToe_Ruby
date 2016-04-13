class Minimax

  def play_move(myBoard, player, opponent)
    return 0 if myBoard.is_empty?
    @current_player = player
    @non_current_player = opponent
    minimax(myBoard, player, opponent)
    @choice
  end

private
  def score(myBoard)
    return 10 if myBoard.game_state == @current_player.mark
    return -10 if myBoard.game_state == @non_current_player.mark
    return 0
  end

  def minimax(myBoard, player, opponent)
    return score(myBoard) if myBoard.game_state != 'Playing'
    scores = []
    moves = []

    myBoard.available_moves.each do |move|
      possible_game_board = myBoard.deep_copy
      possible_game_board.play_move(move, player.mark)
      scores.push minimax(possible_game_board, opponent, player)
      moves.push move
    end
    if player == @current_player
         max_score_index = scores.each_with_index.max[1]
         @choice = moves[max_score_index]
         return scores[max_score_index]
     else
         min_score_index = scores.each_with_index.min[1]
         @choice = moves[min_score_index]
         return scores[min_score_index]
     end
   end
end
