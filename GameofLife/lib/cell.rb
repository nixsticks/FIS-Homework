class Cell
  attr_accessor :state, :new_state
  attr_reader :grid, :x, :y

  NEIGHBORS = [[0,-1], [0,1], [-1,0], [1,0], [-1,-1], [1,-1], [-1,1], [1,1]]

  def initialize(grid, x=0, y=0, state)
    @state = state
    @grid = grid
    @x = x
    @y = y
    @grid.cells["#{@x},#{@y}"] = self
  end

  def live_neighbors
    collect_neighbors.select{|cell| cell.alive?}.size
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

  def collect_neighbors
    neighbors = []

    NEIGHBORS.each do |n|
      n_x = x + n[0]
      n_y = y + n[1]

      neighbors << grid.cells["#{n_x},#{n_y}"] if exists?(n_x) && exists?(n_y)
    end

    neighbors.compact
  end

  def exists?(number)
    number >= 0
  end
end