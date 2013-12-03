require_relative 'grid'
require_relative 'cell'
require_relative 'state'

grid = Grid.new(50, 50)
grid.populate

loop do 
  grid.next_generation
end

