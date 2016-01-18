require_relative 'board'
#require_relative 'player' - tomorrow!

class Game

  def initialize
    @board = Board.new
    play
  end

  def play
    puts "Welcome to the classic game of Chess!"
    puts "WASD and arrow keys move the cursor."
    puts "Press 'return' to select."


    put
  end

end


if __FILE__ == $PROGRAM_NAME
  Game.new.run
end
