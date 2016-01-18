#require_relative 'pieces'

class Piece

  attr_accessor :color, :position, :board, :first_move

  def initialize(position, board, color)
    @color = color
    @position = position
    @board = board
    @first_move = true
  end

  def to_s
      "   "
  end

  def moves
    #pulls from piece's valid moves (Step, Slide, direction, etc)
  end

end
