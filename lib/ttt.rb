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

# todo:: refactor this code!

 # rows
     
     if get_space(0) == get_space(1) && \
        get_space(0) == get_space(2) && \
        get_space(0) != nil
       return @board[0]
     end     
	
     if get_space(3) == get_space(4) && \
        get_space(3) == get_space(5) && \
        get_space(3) != nil
       return @board[3]
     end     

     if get_space(6) == get_space(7) && \
        get_space(6) == get_space(8) && \
        get_space(6) != nil
       return @board[6]
     end     

  #cols

     if get_space(0) == get_space(3) && \
        get_space(0) == get_space(6) && \
        get_space(0) != nil
       return @board[0]
     end

     if get_space(2) == get_space(5) && \
        get_space(2) == get_space(8) && \
        get_space(2) != nil
       return @board[2]
     end


     if get_space(1) == get_space(4) && \
        get_space(1) == get_space(7) && \
        get_space(1) != nil
       return @board[1]
     end
      
  #diagnols

     if get_space(4) == get_space(0) && \
        get_space(4) == get_space(8) && \
        get_space(4) != nil
       return @board[4]
     end


     if get_space(4) == get_space(2) && \
        get_space(4) == get_space(6) && \
        get_space(4) != nil
       return @board[4]
     end


     @board.each do |space|
       return 'Playing' if space == nil
     end
	    
     'Tied'
     
      
    
  end


end