# lib/ttt.rb

class TicTacToe 

  def initialize
    @board = Array.new(9)
  end 

  def clear_board
    @board = Array.new(9)
  end

  def valid_move?(move)     
    return true if @board[move] == nil    
    false    
  end

  def play_move(move, player)
    @board[move] = player if valid_move?(move)
  end

  def get_space(space)
    @board[space]
  end

  def game_state
     
     if get_space(0) == get_space(1) && \
        get_space(0) == get_space(2) && \
        get_space(0) != nil
       return @board[0]
     end     
	
     if get_space(0) == get_space(1) && \
        get_space(0) == get_space(2) && \
        get_space(0) != nil
       return @board[0]
     end     
	    
     'Playing'
     
      
    
  end


end