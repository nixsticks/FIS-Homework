# class Cell
#   attr_accessor :alive
#   def initialize
#     @alive = true
#   end

#   def live_neighbors_count
#     0
#   end

#   def lives?
#     if alive
#       live_neighbors_count > 3 || live_neighbors_count < 2 ? alive = false : alive = true
#     else
#       live_neighbors_count == 3 ? alive = true : alive = false
#     end
#   end
# end

class Cell
  attr_accessor :world, :x, :y

  def initialize(world, x=0, y=0)
    @x = x
    @y = y
    world.cells << self
  end

  def neighbors
    @neighbors = []
    world.cells.each do |cell|
      
    end
  end

  def spawn_at(x, y)
    Cell.new(world, x, y)
  end
end

class World
  attr_accessor :cells

  def initialize
    @cells = []
  end
end