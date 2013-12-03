class Grid
  attr_accessor :cells
  attr_reader :x, :y

  def initialize(x, y)
    @cells = {}
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
    cells.each {|position, cell| cell.compute_state }
    cells.each {|position, cell| cell.transition_state }
  end

  # def printcells
  #   array = []
  #   y.times do
  #     array << Array.new
  #   end

  #   cells.each {|position, cell| cell.alive? ? array[cell.y][cell.x] = "*" : array[cell.y][cell.x] = " "}
  #   array.each do |inner_array|
  #     inner_array.each {|x| print "#{x} "}
  #     puts
  #   end
  #   puts "\n\n"
  #   sleep(0.5)
  # end
end