require 'curses'
require_relative './Menus/main_menu'
require_relative './Core/Colors/base'
require_relative './Core/Colors/terrain'

system('echo -e "\033]50;SetProfile=Terminal-RPG\a"')
system('clear')
system('clear')
puts 'Press enter when ready?'
gets

def setup_curses
  Curses.init_screen
  Curses.start_color
  Curses.curs_set(0)
  Curses.noecho
  init_colors(Curses)
  init_menu_pairs(Curses)
  init_player_pairs(Curses)
  init_terrain_pairs(Curses)
end

def new_window
  win = Curses::Window.new(0, 0, 0, 0)
  win.keypad = true
  win
end

def start_game
  proc { |level| games[level].run }
end

setup_curses
win = new_window

begin
  MAIN_MENU.run(win)
ensure
  Curses.close_screen
  system('echo -e "\033]50;SetProfile=Default\a"')
  system('clear')
end
