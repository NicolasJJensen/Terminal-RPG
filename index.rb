require 'curses'
require_relative './Menus/main_menu'
require_relative './Core/Colors/base'
require_relative './Core/Colors/terrain'

# this line changed the current profile in iTerm2 to the one used for the game
system('echo -e "\033]50;SetProfile=Terminal-RPG\a"')
system('clear')
puts "Maximize your screen to prepare\nThen press enter when ready!"
gets

# this sets up curses and all the colors
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

# this sets up a new window
def new_window
  win = Curses::Window.new(0, 0, 0, 0)
  win.keypad = true
  win
end

# this is a proc used to start a level
def start_game
  proc { |level| games[level].run }
end

# calls initializers
setup_curses
win = new_window

# uses begin block and starts the main manu
begin
  MAIN_MENU.run(win)
ensure
  # the ensure is so the window always closes and the iTerm2 profile is reset
  Curses.close_screen
  system('echo -e "\033]50;SetProfile=Default\a"')
  system('clear')
end
