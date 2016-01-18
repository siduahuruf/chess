require_relative 'pieces'
require 'byebug'

class Board

  #Initial positions of non-pawn pieces
  INITIAL_POSITIONS = {
    :rooks => [[0,0], [7,7], [7,0], [0,7]],
    :bishops => [[0,1],[0,6],[7,1],[7,6]],
    :knights => [[0,2],[0,5],[7,2],[7,5]],
    :queens => [[0,3],[7,4]],
    :kings => [[0,4],[7,3]]
  }

  attr_reader :grid

  def initialize
    #Populate @grid with 64 NullPieces
    @grid = Array.new(8) {Array.new(8) { Piece.new(nil, self, nil) }}
    set_pieces
  end

  def [](pos)
    row, col = pos[0], pos[1]
    return @grid[row][col]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def in_bounds?(pos)
    return true if pos[0].between?(0, 7) && pos[1].between?(0, 7)
    false
  end

  def move(start, end_pos)
    #  This should update the 2D grid and also the moved piece's position.
    #You'll want to raise an exception if: (a) there is no piece at start or
    #(b) the piece cannot move to end_pos.
  end

  private
  #set board functions
  def set_pieces
    set_pawns
    set_other_pieces
  end

  def set_pawns
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |piece, col_idx|
        if row_idx <= 1
          color = :black
        elsif row_idx >= 6
          color = :white
        end
        if row_idx == 1 || row_idx == 6
          self[[row_idx, col_idx]] = Pawn.new([row_idx, col_idx], self, color)
        end
      end
    end
  end

  def set_other_pieces
    INITIAL_POSITIONS.each do |type, positions|
      positions.each do |pos|
        if pos[0] <= 1
          color = :black
        elsif pos[0] >= 6
          color = :white
        end
        if type == :rooks
          self[pos] = Rook.new(pos, self, color)
        elsif type == :bishops
          self[pos] = Bishop.new(pos, self, color)
        elsif type == :knights
          self[pos] = Knight.new(pos, self, color)
        elsif type == :queens
          self[pos] = Queen.new(pos, self, color)
        elsif type == :kings
          self[pos] = King.new(pos, self, color)
        end
      end
    end
  end
end


######################
#
# def set_piece_color
#   @grid.each_with_index do |row, row_idx|
#     if row_idx <= 1
#       row.each do |piece|
#         piece.color = :black
#       end
#     elsif row_idx >= 6
#       row.each do |piece|
#         piece.color = :white
#       end
#     end
#   end
# end
