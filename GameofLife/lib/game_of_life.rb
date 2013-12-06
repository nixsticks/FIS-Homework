require_relative 'grid'
require_relative 'cell'
require_relative 'state'
require_relative 'display'
require 'rainbow'

grid = Grid.new(60, 30)
grid.populate

Display.new(grid).run