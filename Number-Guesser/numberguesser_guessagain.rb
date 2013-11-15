class GuessingGame

  def initialize
    @guesses = []
    @answer
    @turns = 0
    @latest
    @second_latest
  end

  def welcome
    puts "\nGuess what number I am thinking of. Pick a number from 1 to 100."
  end

  def guess
    @guesses << gets.chomp.to_i
    @turns += 1
  end

  def answer
    @answer = rand(1..100)
  end

  def result
    guess

    @latest = @guesses[@turns-1]
    @second_latest = @guesses[@turns- 2]

    if @latest == @answer
      puts "Correct!"
      play_again
    else
      higher_lower
      @turns > 1 ? warmer_colder : result
    end
  end

  def higher_lower
    if @latest > @answer
      puts "It's lower than that."
    else
      puts "It's higher than that."
    end
  end

  def warmer_colder
    if (@answer - @latest).abs < (@answer - @second_latest).abs
      puts "But you're getting warmer..."
      result
    else
      puts "And you're getting colder..."
      result
    end
  end

  def play_again
    puts "\nWould you like to play again?"
    again = gets.chomp.downcase

    case again
    when "y", "yes"
      @turns = 0
      @guesses = []
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
    answer
    result
  end
end

game = GuessingGame.new
game.run
