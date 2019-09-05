# frozen_string_literal: true

require_relative './base'

#=========== ColorPairs ===========#
def init_menu_pairs(curses)
  curses.init_pair(1, JADE_DARK, BLACK)       # Success Text
  curses.init_pair(2, RED_DARK, BLACK)        # Fail Text
  curses.init_pair(3, YELLOW_DARK, BLACK)     # Warning Text
  curses.init_pair(4, GREY, BLACK)            # Disabled Text
  curses.init_pair(5, WHITE, BLACK)           # Text
  curses.init_pair(6, BLACK, BLACK)           # Background
end

TEXT_SUCCESS    = 1
TEXT_FAIL       = 2
TEXT_WARNING    = 3
TEXT_DISABLED   = 4
TEXT            = 5
BACKGROUND      = 6
