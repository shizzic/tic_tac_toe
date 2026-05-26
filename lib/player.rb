# frozen_string_literal: true

# Player of Tic Tac Toe game
class Player
  attr_reader :mark

  def initialize(mark)
    @mark = mark.freeze
  end

  def input
    puts "Player #{mark}, input anything between: 1-9"
    gets.chomp
  end
end
