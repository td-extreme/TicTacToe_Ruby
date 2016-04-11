require 'deep_clone'
require_relative 'ttt'

class Minimax

  def initialize(ttt_game)
    @myGame = ttt_game
  end

  def score(ttt_game)
    return -10 if ttt_game.game_state == @myGame.myPlayers.non_current_player.mark
    return 10 if ttt_game.game_state == @myGame.myPlayers.current_player.mark
    return 0
  end

  def play_move(ttt_game)
    return 8 if ttt_game.myBoard.available_moves.size == 9
    minimax(ttt_game)
    @choice
  end

  def minimax(ttt_game)
    return score(ttt_game) if ttt_game.game_state != 'Playing'
    scores = []
    moves = []

    ttt_game.myBoard.available_moves.each do |move|
      possible_game = DeepClone.clone(ttt_game)
      possible_game.myBoard.play_move(move, possible_game.myPlayers.current_player.mark)
      possible_game.myPlayers.switch_turns
      scores.push minimax(possible_game)
      moves.push move
    end
    if ttt_game.myPlayers.current_player.mark == @myGame.myPlayers.current_player.mark
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
