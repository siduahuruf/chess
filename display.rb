require_relative 'cursorable' #module
require_relative 'board'
require 'colorize'


class Display

  include Cursorable

  attr_reader :board

  def initialize
    @board = Board.new
    @cursor_pos = [0,0]
  end

  def build_grid
    @board.grid.map.with_index do |row, row_idx|
      row.map.with_index do |col, col_idx|
        color_options = colors_for(row_idx, col_idx)
        col.to_s.colorize(color_options)
      end
    end
  end

  def colors_for(row, col)
    if [row, col] == @cursor_pos
      bg= :red
    elsif (row + col).odd?
      bg= :light_blue
    else
      bg = :green
    end
    {background: bg, color: :white } #Piece.color
  end

  def render_board
    system("clear")
    puts "Use WASD to move; return or space to select."
    build_grid.each {|row| puts row.join}
  end

  def play
    until false
      render_board
      get_input
    end
  end

end
