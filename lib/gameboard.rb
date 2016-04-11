class GameBoard

  attr_accessor :board

  def initialize
    @board = Array.new(9, ' ')
    @current_player = @player1
  end

  def clear_board(mark = ' ')
    @board = Array.new(9, mark)
  end

  def available_moves
    moves = Array.new
    board.each.with_index do |val, i|
      moves << i if val == ' '
    end
    moves
  end

  def valid_move?(move)
    return false if move.class != Fixnum
    return false if move < 0
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

  def set_space(space, player)
    @board[space] = player
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
end
