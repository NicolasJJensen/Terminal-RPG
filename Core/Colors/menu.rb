# frozen_string_literal: true

require 'curses'
require_relative './base'

#=========== ColorPairs ===========#

Curses.init_pair(1, JADE_DARK, BLACK)       # Success Text
Curses.init_pair(2, RED_DARK, BLACK)        # Fail Text
Curses.init_pair(3, YELLOW_DARK, BLACK)     # Warning Text
Curses.init_pair(4, GREY, BLACK)            # Disabled Text

TEXT_SUCCESS    = 1
TEXT_FAIL       = 2
TEXT_WARNING    = 3
TEXT_DISABLED   = 4
