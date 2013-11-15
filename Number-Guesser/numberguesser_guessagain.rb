class GuessingGame

  def initialize
    @guess
  end

  def welcome
    puts "\nGuess what number I am thinking of. Pick a number from 1 to 100."
  end

  def guess
    @guess = gets.chomp.to_i
  end

  def guess_again
    puts "Wrong, guess again."
    result
  end

  def answer
    rand(1..100)
  end

  def result
    puts guess == answer ? "Correct!" : guess_again
  end

  def play_again
    puts "\nWould you like to play again?"
    again = gets.chomp.downcase

    case again
    when "y", "yes"
      run
    when "n", "no"
      exit
    else
      puts "\nPlease answer yes or no."
      play_again
    end
  end

  def run
    welcome
    result
    play_again
  end
end

game = GuessingGame.new
game.run
