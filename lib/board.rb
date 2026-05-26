# frozen_string_literal: true

# Board of a Tic Tac Toe game
class Board
  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left column
    [1, 4, 7], # middle column
    [2, 5, 8], # right column
    [0, 4, 8], # diagonal top-left to bottom-right
    [2, 4, 6]  # diagonal top-right to bottom-left
  ].freeze

  attr_reader :win, :grid

  def initialize
    self.win = nil
    @grid = Array.new(9) { it + 1 }
  end

  def set_mark(pos, mark)
    grid[pos - 1] = mark
    update_win(mark)
  end

  def show_board
    puts "\n"
    puts get_line(grid[0..2])
    puts '-----------'
    puts get_line(grid[3..5])
    puts '-----------'
    puts get_line(grid[6..8])
    puts "\n"
  end

  private

  attr_writer :win, :grid

  def update_win(mark)
    self.win = mark if WIN_COMBINATIONS.any? { |a, b, c| [a, b, c].all? { grid[it] == mark } }
  end

  def get_line(line) = line.join(' | ')
end
