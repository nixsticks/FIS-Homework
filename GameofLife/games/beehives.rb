require_relative '../lib/game_of_life'

grid = Grid.new(40, 60)

game = Game.new(grid)
game.beehive(5, 5)
game.beehive(25, 25)
game.beehive(5, 25)
game.beehive(25, 5)
game.run