require 'curses'
require_relative './Core/menu'

class Level
  attr_accessor :name

  def initialize
    @name = 'Level 1'
  end
end

def setup_curses
  Curses.init_screen
  Curses.start_color
  Curses.curs_set(0)
  Curses.noecho
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

level_menu = LevelMenu.new(win, [Level.new()])
controls_menu = ControlMenu.new(win, [])
main_menu = MainMenu.new(win, level_menu, controls_menu)

main_menu.run()
