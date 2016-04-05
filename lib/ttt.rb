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

# todo:: refactor this code! / clean this copy & paste up. 

 # rows
    i = 0
    begin 
      if get_space(i) == get_space(i + 1) && \
         get_space(i) == get_space(i + 2) && \
         get_space(i) != nil
        return @board[i]
      end
      i = i + 3
    end while i <= 6     
    
  #cols      
    for i in 0..2
      if get_space(i) == get_space(i + 3) && \
         get_space(i) == get_space(i + 6) && \
         get_space(i) != nil
        return @board[i]
      end
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