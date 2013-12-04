class Display
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def display
    array = []
    board.y.times do
      array << Array.new
    end

    board.cells.each {|position, cell| cell.alive? ? array[cell.y][cell.x] = "*" : array[cell.y][cell.x] = " "}
    array.each do |inner_array|
      inner_array.each {|x| print "#{x} "}
      puts
    end
    puts "\e[H"
    sleep(0.5)
  end

  def run
    loop do
      board.next_generation
      display
    end
  end
end