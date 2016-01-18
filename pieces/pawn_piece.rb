module PawnPiece

  MOVES = {
    :white =>
    [[-1, 0], [-2, 0], [-1, -1], [-1, 1]],
    :black =>
    [[1, 0], [2, 0], [1, 1], [1, -1]]
  }

  def moves_set(piece_pos, color, board)
    move_set = []

    MOVES[color].each_with_index do |pos, pos_idx|
      piece_prev_pos = board.grid[pos[0]][pos[1]]
      new_pos = [piece_pos[0] + pos[0], piece_pos[1] + pos[1]]
      piece_new_pos = board.grid[new_pos[0]][new_pos[1]]

      if piece_forward?(piece_new_pos) && pos_idx == 1 && self.first_move
        next unless piece_prev_pos.color.nil?
        move_set << new_pos if in_bounds?(new_pos)
      elsif piece_forward?(piece_new_pos) && pos_idx == 0
        move_set << new_pos if in_bounds?(new_pos)
      elsif piece_diagonal?(piece_new_pos) && (pos_idx == 2 || pos_idx == 3)
        move_set << new_pos if in_bounds?(new_pos)
      end
    end

    move_set
  end

  def in_bounds?(pos)
    return true if pos[0].between?(0, 7) && pos[1].between?(0, 7)
    false
  end

  def piece_forward?(piece_new_pos)
    return true if piece_new_pos.color.nil?
    false
  end

  def piece_diagonal?(piece_new_pos)
    return true if piece_new_pos.color != self.color && !piece_new_pos.color.nil?
    false
  end

end

######
#
# if !self.first_move #fix this logic in late game
#   move_set.shift
# end
