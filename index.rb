require 'curses'
require_relative './Core/menu'

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

def to_proc
  proc { |name| "#{@greating}, #{name}!" }
end

setup_curses
win = new_window

menu = MainMenu.new(win)

menu.run()
