require_relative 'piece'
require_relative 'pawn_piece'

require 'byebug'

class Pawn < Piece

  include PawnPiece

  def to_s
    if self.color == :white
      " ♙ "
    elsif self.color == :black
      " ♟ "
    else
      "   "
    end
  end

  def moves
    pos = self.position
    color = self.color
    board = self.board
    final_move = moves_set(pos, color, board)

    @first_move = false
    
    final_move
  end

end
