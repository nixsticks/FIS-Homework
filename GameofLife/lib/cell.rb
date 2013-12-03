class Cell
  attr_accessor :state, :new_state
  attr_reader :grid, :x, :y

  def initialize(grid, x=0, y=0, state)
    @state = state
    @grid = grid
    @x = x
    @y = y
    @grid.cells << self
  end

  def live_neighbors
    grid.cells.select{|cell| (shortest_distance(self, cell) == 2 || shortest_distance(self, cell) == 1) && cell.alive?}.size
  end

  def compute_state
    @new_state = @state.flip_state(live_neighbors)
  end

  def transition_state
    @state = @new_state
  end

  def alive?
    state.is_a?(Alive)
  end

  def shortest_distance(cell1, cell2)
    (cell1.x - cell2.x).abs ** 2 + (cell1.y - cell2.y).abs ** 2
  end
end