# lib/ttt.rb

class TicTacToe 

  def initialize
    @board = Array.new(9)
  end 
  

  def valid_move?(move)     
    return true if @board[move] == nil    
    false    
  end

  def play_move(move, player)
    @board[move] = player 
  end

end