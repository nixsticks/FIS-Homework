require_relative 'grid'
require_relative 'cell'
require_relative 'state'

grid = Grid.new(40, 40)
grid.populate

50.times do 
  grid.next_generation
end

