require 'curses'
require_relative './Menus/main_menu'
require_relative './Core/Colors/base'

def setup_curses
  Curses.init_screen
  Curses.start_color
  Curses.curs_set(0)
  Curses.noecho
  init_colors(Curses)
  init_pairs(Curses)
end

def new_window
  win = Curses::Window.new(0, 0, 0, 0)
  win.nodelay = true
  win.keypad = true
  return win
end

def start_game
  proc { |level| games[level].run }
end

setup_curses
win = new_window

MAIN_MENU.run(win)
