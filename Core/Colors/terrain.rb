# frozen_string_literal: true

require_relative './base'

#=========== ColorPairs ===========#
def init_terrain_pairs(curses)
  curses.init_pair(16, YELLOW_DARK, GREEN_DARK)           # Grass
  curses.init_pair(17, ORANGE_DARKER, GREEN_DARKER)       # Hedge
  curses.init_pair(18, ORANGE_DARKER, ORANGE_LIGHT)       # Brick
end

GRASS = 16
HEDGE = 17
BRICK = 18
