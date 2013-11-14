class GuessingGame
  def answer
    rand(1..100)
  end

  def guess
    puts "Guess what number I'm thinking of! It's between 1 and 100."
    gets.chomp.to_i
  end

  def run
    guess == answer ? "Correct!" : "Wrong!"
  end
end

game = GuessingGame.new
game.run