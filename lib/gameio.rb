# ./lib/io.rb
require 'gameboard'

class GameIo 

  # todo :: move this to an IO Class
  def print_board (gameboard)
    rtn_string = ""
    i = 0
    begin

       rtn_string << " #{gameboard.get_space(i)} | #{gameboard.get_space(i+1)} | #{gameboard.get_space(i+2)} \n"
       rtn_string << "---+---+---\n" if i < 6
       i = i + 3
    end while i <=6
    
    puts rtn_string

  end


end
