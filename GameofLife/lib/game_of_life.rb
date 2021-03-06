require_relative 'grid'
require_relative 'cell'
require_relative 'state'
require_relative 'patterns'
require 'Matrix'
require 'rainbow'

class Game
  include Patterns

  attr_reader :grid, :display

  def initialize(grid)
    @grid = grid
  end

  def display
    grid.cells.to_a.each do |row|
      row.each {|cell| print "\e[?25l#{cell.display}" }
      puts
    end
    puts "\e[H"; sleep(0.05)
  end

  def run
    loop {grid.next_generation; display}
  end
end