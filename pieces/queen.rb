require_relative 'piece'
require_relative 'slide_piece'

class Queen < Piece

  include SlidePiece

  def to_s
    if self.color == :white
      " ♕ "
    elsif self.color == :black
      " ♛ "
    else
      "   "
    end
  end

  def moves
    pos = @position
    type = self.class.to_s
    board = @board
    moves_set(pos, type, board)
  end

end
