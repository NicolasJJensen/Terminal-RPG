# frozen_string_literal: true

require_relative './base'

#=========== ColorPairs ===========#
def init_player_pairs(curses)
  curses.init_pair(7, ORANGE_DARK, ORANGE_DARK)           # Hair
  curses.init_pair(8, ORANGE_PASTEL, ORANGE_PASTEL)       # Skin
  curses.init_pair(9, RED, RED)                           # Shirt
  curses.init_pair(10, SKY, SKY)                          # Pants
  curses.init_pair(11, ORANGE_DARKER, ORANGE_DARKER)      # Shoes
  curses.init_pair(12, BLACK, BLACK)                      # Border
  curses.init_pair(13, WHITE, WHITE)                      # white
  curses.init_pair(14, RED, RED)                          # health
  curses.init_pair(15, BLACK, RED)                        # health text
end

PLAYER_HAIR     = 7
PLAYER_SKIN     = 8
PLAYER_SHIRT    = 9
PLAYER_PANTS    = 10
PLAYER_SHOES    = 11
PLAYER_BORDER   = 12
WHITE_BKG       = 13
HEALTH_BAR      = 14
HEALTH_TEXT     = 15
