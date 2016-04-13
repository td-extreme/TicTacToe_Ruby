require_relative 'gameboard'

class GameIo
  def get_human_move
    puts "Please enter a move to play "
    gets.to_i
  end

  def print_message(message)
    puts message
  end

  def get_input
    gets.chomp
  end

  def print_game_state (gameboard)
    state = gameboard.game_state
    if state == 'Tied'
      puts "Tied Game!"
    elsif state != 'Playing'
      puts "Player #{state} is the Winner!"
    end
    state
  end

  def clear_screen
      print "\e[2J"
      print "\e[H"
  end

  def print_board (gameboard)
    rtn_string = "\n"
    for i in 0...gameboard.row_size
      for j in 0...gameboard.row_size
        space = i * gameboard.row_size + j
        rtn_string << " #{gameboard.get_space(space)} "
        rtn_string << "|" if (j < gameboard.row_size - 1)
      end
      rtn_string << "\n"
      if (i < gameboard.row_size - 1)
        for j in 0...gameboard.row_size
          rtn_string << "---"
          rtn_string << "+" if (j < gameboard.row_size - 1)
          end
          rtn_string << "\n"
        end
      end
    puts rtn_string
  end
end
