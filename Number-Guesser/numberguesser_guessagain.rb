class GuessingGame
  def initialize
    @guesses = []
    @answer
    @turns = 0
    @last_guess
    @second_last_guess
  end

  def welcome
    puts "\nGuess what number I am thinking of. Pick a number from 1 to 100."
  end

  def add_turn
    @turns += 1
  end

  def last_two_guesses
    @last_guess = @guesses[@turns-1]
    @second_last_guess = @guesses[@turns- 2]
  end

  def guess
    get_an_integer
    add_turn
    last_two_guesses
  end

  def get_an_integer
    input = gets.chomp
    if input.match(/\D/) || input.to_i > 100 || input.empty?
      puts "Please enter a number between 1 and 100."
      get_an_integer
    else
      @guesses << input.to_i
    end
  end

  def answer
    @answer = rand(1..100)
  end

  def higher_or_lower
    if @last_guess > @answer
      puts "It's lower than that."
    else
      puts "It's higher than that."
    end
  end

  def warmer_or_colder
    if (@answer - @last_guess).abs < (@answer - @second_last_guess).abs
      puts "But you're getting warmer..."
      result
    else
      puts "And you're getting colder..."
      result
    end
  end

  def result
    guess

    case @last_guess
    when @answer
      puts "Correct!"
      play_again
    else
      higher_or_lower
      @turns > 1 ? warmer_or_colder : result
    end
  end

  def play_again
    puts "\nWould you like to play again?"

    case gets.chomp.downcase
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