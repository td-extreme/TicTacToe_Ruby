# lib/ttt.rb



class GameBoard 

  def initialize
    @board = Array.new(9, ' ')
    @current_player = @player1
  end 

  def clear_board
    @board = Array.new(9, ' ')
  end

  def valid_move?(move)     
    return false if move.class != Fixnum
    return true if @board[move] == ' '
    false    
  end

  def play_move(move, player)
    if valid_move?(move)
      @board[move] = player 
      return true
    end
    false
  end

  def get_space(space)
    @board[space]
  end

  def game_state

    # rows
    i = 0
    begin 
      if get_space(i) == get_space(i + 1) && \
         get_space(i) == get_space(i + 2) && \
         get_space(i) != ' '
        return @board[i]
      end
      i = i + 3
    end while i <= 6     
    
    #cols      
    for i in 0..2
      if get_space(i) == get_space(i + 3) && \
         get_space(i) == get_space(i + 6) && \
         get_space(i) != ' '
        return @board[i]
      end
    end

    #diagnols

     if get_space(4) == get_space(0) && \
        get_space(4) == get_space(8) && \
        get_space(4) != ' '
       return @board[4]
     end

     if get_space(4) == get_space(2) && \
        get_space(4) == get_space(6) && \
        get_space(4) != ' '
       return @board[4]
     end

     @board.each do |space|
       return 'Playing' if space == ' '
     end
	    
     'Tied'    
  end



  def print_board
    rtn_string = ""
    i = 0
    begin

       rtn_string << " #{@board[i]} | #{@board[i+1]} | #{@board[i+2]} \n"
       rtn_string << "---+---+---\n" if i < 6
       i = i + 3
    end while i <=6
    
    puts rtn_string

  end



end



