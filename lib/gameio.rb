# ./lib/io.rb
require_relative 'gameboard'

class GameIo 

  def get_human_move
    puts "Please enter a move to play "
    gets.to_i    
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
    i = 0
    begin

       rtn_string << " #{gameboard.get_space(i)} | #{gameboard.get_space(i+1)} | #{gameboard.get_space(i+2)} \n"
       rtn_string << "---+---+---\n" if i < 6
       i = i + 3
    end while i <=6
    
    puts rtn_string

  end


end
