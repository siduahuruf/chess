require 'byebug'

module SlidePiece

  MOVES = {
    "Rook" =>
  [[0, -1],  [-1, 0],  [0, 1],  [1, 0]],
    "Bishop" =>
  [[-1, -1], [-1, 1], [1, -1], [1, 1]]
  }
  MOVES["Queen"] = MOVES["Rook"] + MOVES["Bishop"]

  def moves_set(piece_pos, type, board)
    move_set = []

    MOVES[type].each do |direction|
      move_set << create_paths(piece_pos, direction)
    end

    final_moves = []

    move_set.each do |array|
      final_moves << check_color(array)
    end

    final_moves.flatten(1)
  end

  def create_paths(current_pos, direction)
    new_pos = [direction[0] + current_pos[0], direction[1] + current_pos[1]]
    return [] unless in_bounds?(new_pos)

    create_paths(new_pos, direction) << new_pos
  end

  def in_bounds?(pos)
    return true if pos[0].between?(0, 7) && pos[1].between?(0, 7)
    false
  end

  def check_color(array_in_direction)
    array_in_direction.each_with_index do |pos, idx|
      if board.grid[pos[0]][pos[1]].color == self.color
        return array_in_direction.drop(idx)
      elsif board.grid[pos[0]][pos[1]].color != self.color
        return array_in_direction.drop(idx+1)
      end
    array_in_direction #found only color == nil
    end

  end

end

####

# MOVES[type].each do |pos|
#   i = 1
#   while i < 9
#     new_pos = [pos[0]*i + piece_pos[0], pos[1]*i + piece_pos[1]]
#     move_set << new_pos if in_bounds?(new_pos)
#     i += 1
#   end
# end
