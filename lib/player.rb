# ./lib/player.rb

class Player

  attr_accessor :mark
  attr_accessor :type

  def initialize (mark, type)
    @mark = mark
    @type = type

    puts "mark = #{mark}"
    puts "@mark = #{@mark}"    
  end

end