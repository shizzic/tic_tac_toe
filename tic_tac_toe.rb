# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/player'

# Tic Tac Poe game
class Game
  BAD_INPUT_MESSAGE = "\nInput must be from 1 to 9 and be untaken!!!\n\n"

  attr_reader :board, :player1, :player2

  def initialize
    @turn           = 0
    @board          = Board.new
    @player1        = Player.new('X')
    @player2        = Player.new('O')
    @current_player = player1
  end

  def start
    while board.win.nil? && turn < 9
      board.show_board
      board.set_mark(move, current_player.mark)
      change_player
    end

    declare
  end

  private

  attr_accessor :current_player, :turn

  def move
    input = current_player.input
    return retry_move unless ('1'..'9').include?(input) # rubocop:disable Performance/RangeInclude

    pos = input.to_i
    return retry_move unless board.grid[pos - 1].is_a?(Integer)

    self.turn += 1
    pos
  end

  def retry_move
    puts BAD_INPUT_MESSAGE
    move
  end

  def change_player
    self.current_player = current_player == player1 ? player2 : player1
  end

  def declare
    board.show_board
    puts board.win ? "The player #{board.win} won!" : 'Draw!'
  end
end

Game.new.start
