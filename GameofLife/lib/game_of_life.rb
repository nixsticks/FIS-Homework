require_relative 'grid'
require_relative 'cell'
require_relative 'state'

grid = Grid.new(30, 30)
grid.populate

loop do 
  grid.next_generation
end

