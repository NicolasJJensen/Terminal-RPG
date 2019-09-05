# frozen_string_literal: true

require_relative './base'

#=========== ColorPairs ===========#
def init_terrain_pairs(curses)
  curses.init_pair(16, YELLOW_DARK, GREEN_DARK)           # Grass
  curses.init_pair(17, ORANGE_DARKER, GREEN_DARKER)       # Hedge
  curses.init_pair(18, ORANGE_DARKER, ORANGE_LIGHT)       # Brick
  curses.init_pair(19, SKY_LIGHT, SKY)                    # Water
  curses.init_pair(20, SKY_PASTEL, SKY)                   # Water Light
end

GRASS = 16
HEDGE = 17
BRICK = 18
WATER = 19
WATER_LIGHT = 20
