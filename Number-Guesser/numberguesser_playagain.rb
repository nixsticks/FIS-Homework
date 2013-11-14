class GuessingGame

  def initialize
    @guess
    @answer
  end

  def guess
    puts "\nGuess what number I am thinking of. Pick a number from 1 to 100."
    @guess = gets.chomp.to_i
  end

  def answer
    @answer = rand(1..100)
  end

  def result
    puts @guess == @answer ? "Correct!" : "Wrong!"
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
    guess
    answer
    result
    puts "Sorry, I was really thinking of #{@answer}."
    play_again
  end
end

game = GuessingGame.new
game.run
