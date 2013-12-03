class Grid
  attr_accessor :cells
  attr_reader :x, :y

  def initialize(x, y)
    @cells = []
    @x = x
    @y = y
  end

  def populate
    x.times do |i|
      y.times do |j|
        r = rand(1..5)
        r < 3 ? state = Alive.new : state = Dead.new
        Cell.new(self, i, j, state)
      end
    end
  end

  def next_generation
    cells.each {|cell| cell.compute_state }
    cells.each {|cell| cell.transition_state }
    printcells
  end

  def printcells
    array = []
    x.times do
      array << Array.new
    end

    cells.each {|cell| cell.alive? ? array[cell.y][cell.x] = "*" : array[cell.y][cell.x] = " "}
    array.each do |inner_array|
      inner_array.each {|x| print "#{x} "}
      puts
    end
    puts "\n\n\n"
  end
end