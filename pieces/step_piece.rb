require 'byebug'

module StepPiece

  MOVES = {
    "King" =>
  [[-1, -1],  [0, -1],  [-1, 0],  [1, -1],
  [-1, 1],  [0, 1],  [1, 0],  [1, 1]],
    "Knight" =>
  [[-2, -1], [-1, -2], [-2, 1], [-1, 2],
  [1, 2], [2, 1], [2, -1], [1, -2]]
}

  def moves_set(piece_pos, type, board)
    move_set = []

    MOVES[type].each do |pos|
      new_pos = [piece_pos[0] + pos[0], piece_pos[1] + pos[1]]
      piece_new_pos = board.grid[new_pos[0]][new_pos[1]]
      move_set << new_pos if in_bounds?(new_pos) && piece_new_pos.color != self.color
    end

    move_set
  end

  def in_bounds?(pos)
    return true if pos[0].between?(0, 7) && pos[1].between?(0, 7)
    false
  end

end
