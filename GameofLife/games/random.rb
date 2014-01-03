require_relative '../lib/game_of_life'

grid = Grid.new(40, 60)
grid.populate_random

game = Game.new(grid)
game.run