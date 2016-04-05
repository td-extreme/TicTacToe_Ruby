# lib/ttt.rb



class TicTacToe 

  def initialize
    @board = Array.new(9, ' ')
    @player1 = 'X'
    @player2 = 'O'
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

  def get_human_move
    puts "Please enter a space to play (0-8) : "
    space = gets.chomp.to_i
    if !(valid_move?(space))
      puts "That space has already been played."
      return false
    end

    space
  end

  def switch_players
    if @current_player == @player1
       @current_player = @player2
    else 
       @current_player = @player1
    end
  end

  def get_current_player
    @current_player
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

  def print_end_game_results
    temp = game_state
    if temp == 'Tied'
      puts "Tied Game"
    else
      puts "The winner is #{temp}!"
    end
      

  end

  def game_loop 
    puts "game loop"
    begin
      print_board
      puts "It is #{@current_player} turn. "
      
      move =  get_human_move
     

      if valid_move?(move)
        play_move(move, @current_player)
        switch_players
      end


    end while game_state == 'Playing'
      print_board
      print_end_game_results
  end

end




myTTT = TicTacToe.new

# myTTT.game_loop