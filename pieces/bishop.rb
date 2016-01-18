require_relative 'piece'
require_relative 'slide_piece'

class Bishop < Piece

  include SlidePiece

  def to_s
    if self.color == :white
      " ♗ "
    elsif self.color == :black
      " ♝ "
    else
      "   "
    end
  end

  def moves
    pos = self.position
    type = self.class.to_s
    board = self.board
    moves_set(pos, type, board)
  end

end
