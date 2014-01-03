require_relative '../lib/game_of_life'

grid = Grid.new(40, 60)

game = Game.new(grid)
game.glider_gun
game.run