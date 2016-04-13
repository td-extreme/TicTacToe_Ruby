class GameBoard

  attr_accessor :board, :row_size

  def initialize (row_size = 3)
    @row_size = row_size
    # @board = Array.new(@row_size * @row_size, ' ')
    @board = Array.new(@row_size) {Array.new(@row_size, ' ')}
  end

  def deep_copy
    temp = self.clone
    temp.board = Array.new(@row_size) {Array.new(@row_size, ' ')}
    temp.board.each_with_index do |rows, i|
      rows.each_with_index do |cols, j|
        temp.board[i][j] = self.board[i][j]
      end
    end
    temp
  end

  def clear_board(mark = ' ')
    @board = Array.new(@row_size) {Array.new(@row_size, mark)}
  end

  def available_moves
    moves = Array.new
    board.each.with_index do |rows, i|
      rows.each.with_index do |val, j|
        moves << to_space(i, j) if val == ' '
      end
    end
    moves
  end

  def valid_move?(move)
    return false if move.class != Fixnum
    return false if move > board_size - 1
    return false if move < 0
    return true if get_space(move) == ' '
    false
  end

  def board_size
    (@row_size * @row_size)
  end

  def is_empty?
    available_moves.size == board_size
  end

  def play_move(move, player)
    if valid_move?(move)
      set_space(move, player)
      return true
    end
    false
  end

  def set_space(space, player)
    row, col = to_row_col(space)
    @board[row][col] = player
  end

  def get_space(space)
    row, col = to_row_col(space)
    @board[row][col]
  end

  def to_row_col(space)
    row = space / row_size
    col = space % row_size
    return row, col
  end

  def to_space(row, col)
    row * row_size + col
  end

  def game_state
    # rows
    for i in 0...(row_size)
      for j in 0..(row_size - 3)
        if @board[i][j] == @board[i][j+1] && \
           @board[i][j] == @board[i][j+2] && \
           @board[i][j] != ' '
          return @board[i][j]
        end
      end
    end

    #cols
    for i in 0..(row_size - 3)
      for j in 0...(row_size)
        if @board[i][j] == @board[i + 1 ][j] && \
           @board[i][j] == @board[i + 2 ][j] && \
           @board[i][j] != ' '
          return @board[i][j]
        end
      end
    end

    #diagnols
      for i in 0..(row_size - 3)
        for j in 0...(row_size)
          if (j - 2 >= 0)
            if @board[i][j] == @board[i+1][j-1] && \
               @board[i][j] == @board[i+2][j-2] && \
               @board[i][j] != ' '
              return @board[i][j]
            end
          end
          if (j + 2 < @row_size)
            if @board[i][j] == @board[i+1][j+1] && \
               @board[i][j] == @board[i+2][j+2] && \
               @board[i][j] != ' '
              return @board[i][j]
            end
          end
        end
      end


     #tied
     @board.each do |rows|
       rows.each do |space|
         return 'Playing' if space == ' '
       end
     end
     'Tied'
   end
 end
