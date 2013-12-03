require_relative 'grid'
require_relative 'cell'
require_relative 'state'
require_relative 'display'

grid = Grid.new(30, 30)
grid.populate

Display.new(grid).run